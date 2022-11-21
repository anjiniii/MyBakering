//
//  RecipeRowView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI
import Kingfisher

struct RecipeRowView: View {
    @ObservedObject var viewModel: RecipeRowViewModel
    
    init(recipe: Recipe) {
        self.viewModel = RecipeRowViewModel(recipe: recipe)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 20) {
                KFImage(URL(string: viewModel.recipe.recipeImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(viewModel.recipe.name)
                            .font(.title3).bold()
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                        Button {
                            (viewModel.recipe.didBookmark ?? false) ?
                            viewModel.unBookmarkRecipe() :
                            viewModel.bookmarkRecipe()
                        } label: {
                            Image(systemName: (viewModel.recipe.didBookmark ?? false) ? "bookmark.fill" : "bookmark")
                        }
                        .padding(.horizontal)
                    }
                    Text(viewModel.recipe.description)
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    if let user = viewModel.recipe.user {
                        HStack {
                            Image(systemName: "person.fill")
                            Text(user.nickname)
                        }
                        .font(.footnote)
                        .foregroundColor(Color(.darkGray))
                    }
                }
            }
            .padding(16)
            
            Divider()
        }
    }
}
