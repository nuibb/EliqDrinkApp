//
//  DetailsView.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/19/22.
//

import SwiftUI

struct DetailsView: View {
    
    // MARK: - PROPERTIES
    private let viewModel: DetailsViewModel
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                DetailsContentView(viewModel: self.viewModel)
                    .animation(.spring(response: 1.5), value: true)
            }
            .navigationTitle(Constants.navigationDetailsTitle)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = DetailsViewModel(drinkId: 0)
        DetailsView(viewModel: viewModel)
    }
}
