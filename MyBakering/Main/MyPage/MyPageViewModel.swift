//
//  MyPageViewModel.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import Foundation

class MyPageViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    private let service = RecipeService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserRecipes()
    }
    
    func fetchUserRecipes() {
        guard let uid = user.id else { return }
        service.fetchRecipes(forUid: uid) { recipes in
            self.recipes = recipes
            
            for i in 0 ..< recipes.count {
                self.recipes[i].user = self.user
            }
        }
    }
}
