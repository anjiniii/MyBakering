//
//  RecipeRowView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI

struct RecipeRowView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 20) {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.accentColor)
                
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
                    if let user = recipe.user {
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
