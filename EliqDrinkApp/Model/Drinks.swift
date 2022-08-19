//
//  Drinks.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/20/22.
//

import Foundation

struct Drinks : Decodable {
    let allDrinks : [Drink]?

    enum CodingKeys: String, CodingKey {
        case drinks = "drinks"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        allDrinks = try values.decodeIfPresent([Drink].self, forKey: .drinks)
    }
}
