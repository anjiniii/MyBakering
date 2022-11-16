//
//  MainTabView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI

struct MainTabView: View {
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
            
            MyPageView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
