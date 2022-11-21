//
//  FeedView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
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
            .navigationTitle("레시피")
            .refreshable {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    viewModel.fetchRecipes()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
