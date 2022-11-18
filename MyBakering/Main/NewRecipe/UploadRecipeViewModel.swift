//
//  UploadRecipeViewModel.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import SwiftUI
import Firebase

class UploadRecipeViewModel: ObservableObject {
    @Published var didUploadRecipe = false
    let service = RecipeService()
    let userService = UserService()
    
    func uploadRecipe(recipeImage: UIImage,
                      name: String,
                      description: String,
                      selectedCategory: String,
                      ingredients: [String],
                      steps: [String]) {
        RecipeImageUploader.uploadImage(image: recipeImage) { recipeImageUrl in
            self.service.uploadRecipe(recipeImageUrl: recipeImageUrl,
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
}
