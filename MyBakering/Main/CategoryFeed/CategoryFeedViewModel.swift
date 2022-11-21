//
//  CategoryRecipeViewModel.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import Foundation

class CategoryFeedViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    private let service = RecipeService()
    private let userService = UserService()
    let user: User
    
    init(user: User, category: String) {
        self.user = user
        self.fetchCategoryRecipes(category: category)
    }
    
    func fetchCategoryRecipes(category: String) {
        service.fetchRecipes(forCategory: category) { recipes in
            self.recipes = recipes
            
            for i in 0 ..< recipes.count {
                let uid = recipes[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.recipes[i].user = user
                }
            }
        }
    }
}
