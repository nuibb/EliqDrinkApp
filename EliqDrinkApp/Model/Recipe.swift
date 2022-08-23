//
//  Recipe.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/23/22.
//

import Foundation

struct Recipe: Identifiable, Hashable {
    internal let id: Int
    let ingredient: String
    let measure: String
    
    init(id: Int, ingredient: String, measure: String) {
        self.id = id
        self.ingredient = ingredient
        self.measure = measure
    }
}
