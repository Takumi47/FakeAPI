//
//  FileManager.swift
//  API
//
//  Created by xander on 2023/5/23.
//

import Foundation

class FileManager {
    static let shared = FileManager()
    
    private init() {}
    
    func load(filename: String) throws -> Data {
        guard let url = Bundle(for: Self.self).url(forResource: filename, withExtension: "json") else {
            throw NSError(domain: "No data", code: 0)
        }
        return try Data(contentsOf: url)
    }
}
