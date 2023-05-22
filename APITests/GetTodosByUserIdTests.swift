//
//  GetTodosByUserIdTests.swift
//  APITests
//
//  Created by xander on 2023/5/23.
//

import XCTest
@testable import API

final class GetTodosByUserIdTests: XCTestCase {

    func test_GetTodosByUserId_Request() async throws {
        let exp = expectation(description: "")
        let userId = "918CAB82-3F20-4D9D-90D0-D8EA922E73B0"
        
        let network = Session.stub
        let operation = GraphQL.getTodosByUserId(id: userId)
        var response: User?
        network.fetch(operation) { result in
            switch result {
            case .success(let user):
                response = user
                exp.fulfill()
            case .failure(_):
                break
            }
        }
        
        XCTAssertNotNil(response)
        if let user = response {
            XCTAssertEqual(user.id, userId)
            XCTAssertEqual(user.todos?.count, 2)
        }
        wait(for: [exp], timeout: 1)
    }
}
