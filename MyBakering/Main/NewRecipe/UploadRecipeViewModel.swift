//
//  UploadRecipeViewModel.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import Foundation

class UploadRecipeViewModel: ObservableObject {
    @Published var didUploadRecipe = false
    let service = RecipeService()
    let userService = UserService()
    
    func uploadRecipe(recipeImage: String,
                      name: String,
                      description: String,
                      selectedCategory: String,
                      ingredients: [String],
                      steps: [String]) {
        service.uploadRecipe(recipeImage: recipeImage,
                             name: name, description: description,
                             selectedCategory: selectedCategory,
                             ingredients: ingredients,
                             steps: steps) { success in
            if success {
                self.didUploadRecipe = true
            }
        }
    }
}
