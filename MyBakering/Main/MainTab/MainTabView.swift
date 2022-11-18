//
//  MainTabView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            CategoriesView()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
            
            NewRecipeView()
                .tabItem {
                    Image(systemName: "highlighter")
                }
            if let user = authViewModel.currentUser {
                MyPageView(user: user)
                    .tabItem {
                        Image(systemName: "person.crop.circle.fill")
                    }
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
