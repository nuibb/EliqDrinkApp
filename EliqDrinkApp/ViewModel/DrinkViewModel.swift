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
        return Int(self.drink.idDrink ?? "0")!
    }
    
    var title: String {
        return self.drink.strDrink ?? ""
    }
    
    var thumbUrl: String {
        return self.drink.strDrinkThumb ?? ""
    }
    
    init(drink: Drink) {
        self.drink = drink
    }
}
