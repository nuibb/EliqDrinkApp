//
//  DetailsView.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/19/22.
//

import SwiftUI

struct DetailsView: View {
    var drinkId: Int
    
    init(drinkId: Int) {
        self.drinkId = drinkId
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(drinkId: 1)
    }
}
