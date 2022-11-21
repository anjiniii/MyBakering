//
//  RecipeView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/17.
//

import SwiftUI
import Kingfisher

struct RecipeView: View {
    let recipe: Recipe
    var ingredients = [["버터", "100g"],
                       ["올리고당", "20g"],
                       ["박력분", "1.5컵"],
                       ["베이킹파우더", "2g"],
                       ["황설탕", "60g"],
                       ["계란", "1개"],
                       ["코코아가루", "15g"],
                       ["초코칩", "80g"]]
    var steps = ["버터를 풀어준다",
                 "풀어준 버터에 설탕을 넣고 섞는다",
                 "올리고당을 넣고 섞는다",
                 "계란을 넣고 섞는다",
                 "박력분+코코아가루+베이킹파우더를 체쳐넣고 섞는다",
                 "초코칩을 넣고 섞는다",
                 "한 스푼씩 떠서 눌러 준 후",
                 "오븐(180℃)에서 10~12분간 굽는다",
                 "촉촉한 초코칩쿠키",
                 "속은 촉촉하고 겉은 바삭까지는 아니지만 맛있어요",
                 "우유에 콕 찍어먹어도 맛있구 아이들 간식으로 제격이에요"]
    var count = 1
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        KFImage(URL(string: recipe.recipeImageUrl))
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
                                    ForEach(0 ..< recipe.ingredients.count, id: \.self) { i in
                                        VStack(spacing: 4) {
                                            HStack(alignment: .top) {
                                                Text(recipe.ingredients[i])
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
                                
                                ForEach(0 ..< recipe.steps.count, id: \.self) { i in
                                    HStack(alignment: .top) {
                                        Image(systemName: "\(i+1).square.fill")
                                            .foregroundColor(Color.myLightBrown)
                                        Text(recipe.steps[i])
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
            .navigationTitle(recipe.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var recipeInfo: some View {
        Group {
            HStack(alignment: .bottom, spacing: 20) {
                Text(recipe.name)
                    .font(.title).bold()
                Text(recipe.selectedCategory)
                    .foregroundColor(Color.accentColor)
            }
            .padding(.vertical)
            
            Text(recipe.description)
            
            HStack {
                Image(systemName: "person.fill")
                Text(recipe.user?.nickname ?? "")
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
