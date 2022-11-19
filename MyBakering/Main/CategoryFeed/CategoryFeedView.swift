//
//  CategoryFeedView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import SwiftUI

struct CategoryFeedView: View {
    @ObservedObject var viewModel: CategoryFeedViewModel
    
    init(user: User, category: String) {
        self.viewModel = CategoryFeedViewModel(user: user, category: category)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.recipes) { recipe in
                        NavigationLink {
                            RecipeView()
                        } label: {
                            RecipeRowView(recipe: recipe)
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

//struct CategoryFeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryFeedView()
//    }
//}
