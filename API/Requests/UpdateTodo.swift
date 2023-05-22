//
//  UpdateTodo.swift
//  API
//
//  Created by xander on 2023/5/23.
//

import Foundation

extension GraphQL where Input == UpdateTodoInput, Output == Todo {
    public static func updateTodo(id: String, description: String, done: Bool) -> Self {
        GraphQL(
            input: UpdateTodoInput(id: id, description: description, done: done),
            sampleString: "UpdateTodo",
            operationString:
            """
            mutation($input: UpdateTodoInput!) {
              updateTodo(input: $input) {
                id
                done
              }
            }
            """
        )
    }
}
