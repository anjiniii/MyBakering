//
//  MyPageViewModel.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import Foundation

class MyPageViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    @Published var bookmarkedRecipes = [Recipe]()
    private let service = RecipeService()
    private let userService = UserService()
    
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserRecipes()
        self.fetchBookmarkedRecipes()
    }
    
    func recipes(forfilter filter: MyPageFilterViewModel) -> [Recipe] {
        switch filter {
        case .recipes:
            return recipes
        case .bookmark:
            return bookmarkedRecipes
        }
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
    
    func fetchBookmarkedRecipes() {
        guard let uid = user.id else { return }
        
        service.fetchBookmarkedRecipes(foruid: uid) { recipes in
            self.bookmarkedRecipes = recipes
            
            for i in 0 ..< recipes.count {
                let uid = recipes[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.bookmarkedRecipes[i].user = user
                }
            }
        }
    }
}
