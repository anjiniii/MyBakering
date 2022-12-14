//
//  CategoryRecipeRowVIew.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/21.
//

import SwiftUI
import Kingfisher

struct CategoryRecipeRowView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 20) {
                KFImage(URL(string: recipe.recipeImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(recipe.name)
                            .font(.title3).bold()
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bookmark")
                        }
                        .padding(.horizontal)
                    }
                    Text(recipe.description)
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
            }
            .padding(16)
            
            Divider()
        }
    }
}

