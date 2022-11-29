//
//  CategoryFeedView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import SwiftUI

struct CategoryFeedView: View {
    @ObservedObject var viewModel: CategoryFeedViewModel
    @State private var category: String
    
    init(user: User, category: String) {
        self.viewModel = CategoryFeedViewModel(user: user, category: category)
        self.category = category
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.recipes) { recipe in
                        NavigationLink {
                            RecipeView(recipe: recipe)
                        } label: {
                            RecipeRowView(recipe: recipe)
                        }
                    }
                }
            }
            .navigationTitle(category)
            .refreshable {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    viewModel.fetchCategoryRecipes(category: category)
                }
            }
        }
    }
}
