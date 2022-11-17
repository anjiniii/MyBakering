//
//  Ingredient.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/17.
//

import Foundation

struct Ingredient {
    var ingredientTitle: String
    var volume: String
}

class IngredientsStore: ObservableObject {
    @Published var ingredients = [Ingredient]()
}
