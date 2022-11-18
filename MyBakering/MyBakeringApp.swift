//
//  MyBakeringApp.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI
import Firebase

@main
struct MyBakeringApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
