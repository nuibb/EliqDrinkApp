//
//  ApiEndPoints.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/20/22.
//

import Foundation

//https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic
//https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=15423

enum EndPoint {
    static let scheme = "https"
    static let host = "www.thecocktaildb.com"
    static let path = "/api/json/v1/1/filter.php"
    static let queryParam = "a"
    static let query = "Alcoholic"
}

