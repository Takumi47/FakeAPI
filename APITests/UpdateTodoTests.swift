//
//  UpdateTodoTests.swift
//  APITests
//
//  Created by xander on 2023/5/23.
//

import XCTest
@testable import API

final class UpdateTodoTests: XCTestCase {
    
    func test_GetTodosByUserId_Request() async throws {
        let exp = expectation(description: "")
        let todoId = "1F9A789F-9F89-4A50-9DA0-07F9E139FD19"
        
        let network = Session.stub
        let operation = GraphQL.updateTodo(id: todoId, description: "", done: true)
        var response: Todo?
        network.fetch(operation) { result in
            switch result {
            case .success(let todo):
                response = todo
                exp.fulfill()
            case .failure(_):
                break
            }
        }
        
        XCTAssertNotNil(response)
        if let todo = response {
            XCTAssertEqual(todo.id, todoId)
            XCTAssertEqual(todo.done, true)
        }
        wait(for: [exp], timeout: 1)
    }
}
