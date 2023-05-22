//
//  ContentView.swift
//  FakeAPI
//
//  Created by xander on 2023/5/23.
//

import API
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Response")
                .font(.largeTitle)
            TextField("", text: $viewModel.text, axis: .vertical)
                .lineLimit(2...4)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.black)
                .padding()
            
            VStack {
                HStack {
                    Button {
                        viewModel.getAllUsers()
                    } label: {
                        Text("getAllUsers()")
                    }
                    .buttonStyle(FilledButton())
                    
                    Button {
                        viewModel.getTodosByUserId()
                    } label: {
                        Text("getTodosByUserId()")
                    }
                    .buttonStyle(FilledButton())
                }
                
                HStack {
                    Button {
                        viewModel.updateTodo()
                    } label: {
                        Text("updateTodo()")
                    }
                    .buttonStyle(FilledButton())
                    
                    Button {
                        viewModel.clear()
                    } label: {
                        Text("clear()")
                    }
                    .buttonStyle(FilledButton())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel(network: Session.stub))
    }
}

struct FilledButton: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(isEnabled ? Color.accentColor : .gray)
            .cornerRadius(8)
    }
}
