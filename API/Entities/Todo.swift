//
//  Todo.swift
//  API
//
//  Created by xander on 2023/5/23.
//

import Foundation

public struct Todo: Codable {
    public let id: String
    public let description: String?
    public let done: Bool
}
