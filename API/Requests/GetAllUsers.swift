//
//  GetAllUsers.swift
//  API
//
//  Created by xander on 2023/5/23.
//

import Foundation

extension GraphQL where Input == Empty, Output == [User] {
    public static func getAllUsers() -> Self {
        GraphQL(
            input: Empty(),
            sampleString: "Users",
            operationString:
            """
            {
              users {
                id
                email
                name
              }
            }
            """
        )
    }
}
