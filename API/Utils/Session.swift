//
//  Session.swift
//  API
//
//  Created by xander on 2023/5/23.
//

import Foundation

public protocol SessionProtocol {
    func fetch<Input, Output>(_ operation: GraphQL<Input, Output>, completion: @escaping (Result<Output, Error>) -> Void)
}

struct LiveSession: SessionProtocol {
    func fetch<Input, Output>(_ operation: GraphQL<Input, Output>, completion: @escaping (Result<Output, Error>) -> Void) where Input : Encodable, Output : Decodable {
        let request: URLRequest
        
        do {
            request = try operation.getURLRequest()
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(GraphQLResult<Output>.self, from: data)
                if let object = result.object {
                    completion(.success(object))
                } else {
                    print(result.errorMessages.joined(separator: "\n"))
                    completion(.failure(NSError(domain: "Server error", code: 1)))
                }
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
}

struct StubSession: SessionProtocol {
    func fetch<Input, Output>(_ operation: GraphQL<Input, Output>, completion: @escaping (Result<Output, Error>) -> Void) where Input : Encodable, Output : Decodable {
        do {
            let data = try operation.getSampleData()
            let result = try JSONDecoder().decode(GraphQLResult<Output>.self, from: data)
            if let object = result.object {
                completion(.success(object))
            } else {
                print(result.errorMessages.joined(separator: "\n"))
                completion(.failure(NSError(domain: "Parsing error", code: 2)))
            }
        } catch {
            completion(.failure(error))
        }
    }
}

public enum Session {
    public static var live: SessionProtocol {
        LiveSession()
    }
    
    public static var stub: SessionProtocol {
        StubSession()
    }
}

