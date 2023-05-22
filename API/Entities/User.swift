//
//  User.swift
//  API
//
//  Created by xander on 2023/5/23.
//

import Foundation

public struct User: Codable {
    public let id: String
    public let email: String?
    public let name: String?
    public let todos: [Todo]?
}
