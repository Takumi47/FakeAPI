//
//  GetAllUsersTests.swift
//  APITests
//
//  Created by xander on 2023/5/23.
//

import XCTest
@testable import API

final class GetAllUsersTests: XCTestCase {
    
    func test_GetAllUsers_Request() async throws {
        let exp = expectation(description: "")
        
        let network = Session.stub
        let operation = GraphQL.getAllUsers()
        var response: [User] = []
        network.fetch(operation) { result in
            switch result {
            case .success(let users):
                response = users
                exp.fulfill()
            case .failure(_):
                break
            }
        }
        
        XCTAssertEqual(response.count, 2)
        wait(for: [exp], timeout: 1)
    }
}
