//
//  Ingredient.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/17.
//

import Foundation

struct Ingredient {
    var ingredient: String
    var volume: String
}

class Ingredients {
    @Published var ingredients = [Ingredient]()
}
