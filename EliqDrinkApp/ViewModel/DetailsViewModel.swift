//
//  DetailsViewModel.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/21/22.
//

import Foundation

struct DetailsViewModel: Identifiable {
    private let drinkId: Int
    
    init(drinkId: Int) {
        self.drinkId = drinkId
    }
    
    var id: Int {
        //return Int(self.drink.idDrink ?? "0")!
        return 0
    }
    
    var thumbUrl: String {
        return "https://www.thecocktaildb.com/images/media/drink/uxywyw1468877224.jpg"
    }
}
