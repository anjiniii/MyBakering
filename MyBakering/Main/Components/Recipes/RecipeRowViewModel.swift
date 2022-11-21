//
//  RecipeRowViewModel.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/21.
//

import Foundation

class RecipeRowViewModel: ObservableObject {
    @Published var recipe: Recipe
    private let service = RecipeService()
    
    init(recipe: Recipe) {
        self.recipe = recipe
        checkIfUserBookmarkRecipe()
    }
    
    func bookmarkRecipe() {
        service.bookmarkRecipe(recipe) {
            self.recipe.didBookmark = true
        }
    }
    
    func unBookmarkRecipe() {
        service.unBookmarkRecipe(recipe) {
            self.recipe.didBookmark = false
        }
    }
    
    func checkIfUserBookmarkRecipe() {
        service.checkIfUserBookmarkRecipe(recipe) { didBookmark in
            if didBookmark {
                self.recipe.didBookmark = true
            }
        }
    }
}
