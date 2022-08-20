//
//  Drinks.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/20/22.
//

import Foundation

struct Drinks : Decodable {
    let allDrinks : [Drink]

    enum CodingKeys: String, CodingKey {
        case drinks = "drinks"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        allDrinks = try values.decodeIfPresent([Drink].self, forKey: .drinks) ?? []
    }
}

struct Drink : Codable {
    let strDrink : String?
    let strDrinkThumb : String?
    let idDrink : String?
    
    init(idDrink: String, strDrink: String, strDrinkThumb: String) {
        self.idDrink = idDrink
        self.strDrink = strDrink
        self.strDrinkThumb = strDrinkThumb
    }

    enum CodingKeys: String, CodingKey {
        case strDrink = "strDrink"
        case strDrinkThumb = "strDrinkThumb"
        case idDrink = "idDrink"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        strDrink = try values.decodeIfPresent(String.self, forKey: .strDrink)
        strDrinkThumb = try values.decodeIfPresent(String.self, forKey: .strDrinkThumb)
        idDrink = try values.decodeIfPresent(String.self, forKey: .idDrink)
    }

}

