//
//  UpdateTodoInput.swift
//  API
//
//  Created by xander on 2023/5/23.
//

import Foundation

public struct UpdateTodoInput: Codable {
    public let input: Input
    
    public struct Input: Codable {
        public let id: String
        public let description: String?
        public let done: Bool
    }
    
    init(id: String, description: String, done: Bool) {
        self.input = Input(id: id, description: description, done: done)
    }
}
