//
//  DetailsContentView.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/21/22.
//

import SwiftUI

struct DetailsContentView: View {
    
    // MARK: - PROPERTIES
    private let viewModel: DetailsViewModel
    //@State var items: [Any] = []
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - BODY
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: viewModel.thumbUrl), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                switch phase {
                case .success(let image):
                    image.imageModifier(lineWidth: 5.0)
                case .failure(_):
                    Image(systemName: Constants.failedPhaseIcon).iconModifier()
                case .empty:
                    Image(systemName: Constants.emptyPhaseIcon).iconModifier()
                @unknown default:
                    ProgressView()
                }
            }
            Text("Penicillin")
                .headerTextModifier()
            Text("Penicillin Description details here! Penicillin Description details here! Penicillin Description details here! Penicillin Description details here! Penicillin Description details here!")
                .descriptionTextModifier()
            Text("Penicillin")
                .itemTextModifier()
        }
        .padding(40)
    }
}

struct DetailsContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = DetailsViewModel(drinkId: 0)
        DetailsContentView(viewModel: viewModel)
    }
}
