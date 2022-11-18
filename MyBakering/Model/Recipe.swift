//
//  Recipe.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import Firebase
import FirebaseFirestoreSwift

struct Recipe: Identifiable, Decodable {
    @DocumentID var id: String?
    let uid: String
    let recipeImageUrl: String
    let name: String
    let description: String
    let selectedCategory: String
    let ingredients: [String]
    let steps: [String]
    let timestamp: Timestamp
    
    var user: User?
}
