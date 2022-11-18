//
//  FeedViewModel.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    let service = RecipeService()
    let userService = UserService()
    
    init() {
        fetchRecipes()
    }
    
    func fetchRecipes() {
        service.fetchRecipes { recipes in
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
