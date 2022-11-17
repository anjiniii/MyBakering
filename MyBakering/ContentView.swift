//
//  ContentView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI

struct ContentView: View {
    var userSession: String? = "wow"
    
    var body: some View {
        if userSession == nil {
            LoginView()
        } else {
            MainTabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
