//
//  RecipeService.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import Firebase

struct RecipeService {
    
    func uploadRecipe(recipeImageUrl: String,
                      name: String,
                      description: String,
                      selectedCategory: String,
                      ingredients: [String],
                      steps: [String], completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else  { return }
        
        let data = ["uid": uid,
                    "recipeImageUrl": recipeImageUrl,
                    "name": name,
                    "description": description,
                    "selectedCategory": selectedCategory,
                    "ingredients": ingredients,
                    "steps": steps,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("recipes").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload recipe with error .. \(error.localizedDescription)")
                    completion(false)
                    return
                }
                print("DEBUG: Did upload recipe ..")
                
                completion(true)
            }
    }
    
    func fetchRecipes(completion: @escaping([Recipe]) -> Void) {
        Firestore.firestore().collection("recipes")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
                
            let recipes = documents.compactMap({ try? $0.data(as: Recipe.self) })
            completion(recipes)
        }
    }
    
    func fetchRecipes(forUid uid: String, completion: @escaping([Recipe]) -> Void) {
            Firestore.firestore().collection("recipes")
                .whereField("uid", isEqualTo: uid)
                .getDocuments { snapshot, error in
                    guard let documents = snapshot?.documents else { return }
                    
                    let recipes = documents.compactMap({ try? $0.data(as: Recipe.self)}) as! [Recipe]
                    completion(recipes.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
                }
        }
}
