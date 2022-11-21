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
    
    func fetchRecipes(forCategory category: String, completion: @escaping([Recipe]) -> Void) {
            Firestore.firestore().collection("recipes")
                .whereField("selectedCategory", isEqualTo: category)
                .getDocuments { snapshot, error in
                    guard let documents = snapshot?.documents else { return }
                    
                    let recipes = documents.compactMap({ try? $0.data(as: Recipe.self)}) as! [Recipe]
                    completion(recipes.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
                }
        }
}

extension RecipeService {
    func bookmarkRecipe(_ recipe: Recipe, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let recipeId = recipe.id else { return }
        
        let userBookmarkRef = Firestore.firestore().collection("users").document(uid).collection("user-bookmarks")
        
        userBookmarkRef.document(recipeId).setData([:]) { _ in
            completion()
            print("DEBUG: Did like tweet and now we update UI")
        }
    }
    
    func unBookmarkRecipe(_ recipe: Recipe, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let recipeId = recipe.id else { return }
        
        let userBookmarkRef = Firestore.firestore().collection("users").document(uid).collection("user-bookmarks")
        
        userBookmarkRef.document(recipeId).delete() { _ in
            completion()
        }
    }
    
    func checkIfUserBookmarkRecipe(_ recipe: Recipe, completion: @escaping(Bool) -> Void) {
        print("RecipeService_checkIfUserBookmarkRecipe")
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let recipeId = recipe.id else { return }
        
        Firestore.firestore().collection("users").document(uid).collection("user-bookmarks")
            .document(recipeId).getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                print("RecipeService_checkIsUserBookmarkRecipe is liked : \(snapshot.exists)")
                completion(snapshot.exists)
            }
    }
    
    func fetchBookmarkedRecipes(foruid uid: String, completion: @escaping([Recipe]) -> Void) {
        var recipes = [Recipe]()
        print("fetchBookmarkedRecipes")
        Firestore.firestore().collection("users").document(uid)
            .collection("user-bookmarks").getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                documents.forEach { document in
                    let recipeId = document.documentID
                    
                    Firestore.firestore().collection("recipes").document(recipeId)
                        .getDocument { snapshot, _ in
                            guard let recipe = try? snapshot?.data(as: Recipe.self) else { return }
                            recipes.append(recipe)
                            
                            completion(recipes)
                        }
                }
        }
    }
}
