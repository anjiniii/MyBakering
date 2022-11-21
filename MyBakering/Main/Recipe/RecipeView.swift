//
//  RecipeView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/17.
//

import SwiftUI
import Kingfisher

struct RecipeView: View {
    @ObservedObject var viewModel: RecipeRowViewModel
    
    init(recipe: Recipe) {
        self.viewModel = RecipeRowViewModel(recipe: recipe)
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        KFImage(URL(string: viewModel.recipe.recipeImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: 300)
                            .clipShape(Rectangle())
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack{ Spacer() }
                            
                            recipeInfo
                            
                            Divider()
                            
                            // 재료
                            VStack(alignment: .leading) {
                                Text("재료")
                                    .font(.title3)
                                    .padding(.bottom)
                                
                                LazyVGrid(columns: [GridItem(.fixed(160)), GridItem(.fixed(160))],
                                          alignment: .center,
                                          spacing: 10) {
                                    ForEach(0 ..< viewModel.recipe.ingredients.count, id: \.self) { i in
                                        VStack(spacing: 4) {
                                            HStack(alignment: .top) {
                                                Text(viewModel.recipe.ingredients[i])
                                                Spacer()
                                            }
                                            Divider()
                                        }
                                    }
                                }
                            }
                            .padding(.vertical)
                            
                            Divider()
                            
                            // 과정
                            VStack(alignment: .leading, spacing: 16) {
                                Text("과정")
                                    .font(.title3)
                                
                                ForEach(0 ..< viewModel.recipe.steps.count, id: \.self) { i in
                                    HStack(alignment: .top) {
                                        Image(systemName: "\(i+1).square.fill")
                                            .foregroundColor(Color.myLightBrown)
                                        Text(viewModel.recipe.steps[i])
                                    }
                                }
                                
                            }
                            .padding(.vertical)
                            
                        }
                        .padding()
                        .background(Color.white)
                        .clipShape(RecipeRoundedShape(coners: [.topLeft, .topRight]))
                        .offset(y: -30)
                        
                    }
                    .offset(y: -100)
                    .ignoresSafeArea()
                }
            }
            .navigationTitle(viewModel.recipe.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var recipeInfo: some View {
        Group {
            HStack(alignment: .top) {
                HStack(alignment: .bottom, spacing: 20) {
                    Text(viewModel.recipe.name)
                        .font(.title).bold()
                    Text(viewModel.recipe.selectedCategory)
                        .foregroundColor(Color.accentColor)
                }
                
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
            .padding(.vertical)
            
            Text(viewModel.recipe.description)
            
            HStack {
                Image(systemName: "person.fill")
                Text(viewModel.recipe.user?.nickname ?? "")
            }
            .font(.footnote)
            .foregroundColor(Color.accentColor)
        }
    }
}

struct RecipeRoundedShape: Shape {
    var coners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: coners, cornerRadii: CGSize(width: 20, height: 20))
        
        return Path(path.cgPath)
    }
}
