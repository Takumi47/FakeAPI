//
//  ViewModel.swift
//  FakeAPI
//
//  Created by xander on 2023/5/23.
//

import API
import Foundation

class ViewModel: ObservableObject {
    let network: SessionProtocol
    @Published var text: String = ""
    
    init(network: SessionProtocol) {
        self.network = network
    }
    
    func getAllUsers() {
        let operation = GraphQL.getAllUsers()
        network.fetch(operation) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.text = self.printJSON(users)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.text = self.printJSON(error.localizedDescription)
                }
            }
        }
    }
    
    func getTodosByUserId() {
        let operation = GraphQL.getTodosByUserId(id: "Hello World")
        network.fetch(operation) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.text = self.printJSON(users)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.text = self.printJSON(error.localizedDescription)
                }
            }
        }
    }
    
    func updateTodo() {
        let operation = GraphQL.updateTodo(id: "Hello World", description: "", done: false)
        network.fetch(operation) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.text = self.printJSON(users)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.text = self.printJSON(error.localizedDescription)
                }
            }
        }
    }
    
    func clear() {
        text = ""
    }
    
    func printJSON(_ object: Codable) -> String {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object), let json = String(data: encoded, encoding: .utf8) {
            return json
        } else {
            return ""
        }
    }
}
