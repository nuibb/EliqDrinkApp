//
//  DrinkViewModel.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/20/22.
//

import Foundation
import SwiftUI

struct DrinkViewModel: Identifiable {
    private let drink: Drink
    
    var id: Int {
        return Int(drink.idDrink ?? "0")!
    }
    
    var title: String {
        return drink.strDrink ?? ""
    }
    
    var thumbUrl: String {
        return drink.strDrinkThumb ?? ""
    }
    
    init(drink: Drink) {
        self.drink = drink
    }
}
