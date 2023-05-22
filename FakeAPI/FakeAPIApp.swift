//
//  FakeAPIApp.swift
//  FakeAPI
//
//  Created by xander on 2023/5/23.
//

import API
import SwiftUI

@main
struct FakeAPIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel(network: Session.live))
        }
    }
}
