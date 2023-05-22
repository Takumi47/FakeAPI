//
//  GetTodosByUserId.swift
//  API
//
//  Created by xander on 2023/5/23.
//

import Foundation

extension GraphQL where Input == IDInput, Output == User {
    public static func getTodosByUserId(id: String) -> Self {
        GraphQL(
            input: IDInput(id: id),
            sampleString: "TodosById",
            operationString:
            """
            query GetUserById($id: String) {
              user(id: $id) {
                id
                todos {
                  id
                  description
                  done
                }
              }
            }
            """
        )
    }
}
