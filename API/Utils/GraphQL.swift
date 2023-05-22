//
//  GraphQL.swift
//  API
//
//  Created by xander on 2023/5/23.
//

import Foundation

public struct GraphQL<Input: Encodable, Output: Decodable>: Encodable {
    var input: Input
    var sampleString: String
    var operationString: String
    
    private let url = URL(string: "https://api.mocki.io/v2/c4d7a195/graphql")!
    
    enum CodingKeys: String, CodingKey {
        case variables
        case sample
        case query
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(input, forKey: .variables)
        try container.encode(sampleString, forKey: .sample)
        try container.encode(operationString, forKey: .query)
    }
    
    func getURLRequest() throws -> URLRequest {
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(self)
        
        return request
    }
    
    func getSampleData() throws -> Data {
        try FileManager.shared.load(filename: sampleString)
    }
}
