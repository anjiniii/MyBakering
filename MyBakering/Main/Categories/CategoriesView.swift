//
//  CategoriesView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        if let user = authViewModel.currentUser {
            NavigationStack {
                VStack {
                    ScrollView {
                        LazyVStack {
                            ForEach(CategoriesViewModel.allCases, id: \.rawValue) { item in
                                NavigationLink {
                                    CategoryFeedView(user: user, category: item.title)
                                } label: {
                                    CategoryRowView(item: item)
                                        .padding(.horizontal, 24)
                                        .padding(.vertical, 8)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("카테고리")
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
