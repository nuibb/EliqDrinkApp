//
//  DetailsContentView.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/21/22.
//

import SwiftUI

struct DetailsContentView: View {
    
    // MARK: - PROPERTIES
    @ObservedObject var viewModel: DetailsViewModel
    //@State var recipes: [Recipe]
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        //self.recipes = [Recipe(id: 1, ingredient: "dd", measure: "gg")]
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
            Text(viewModel.category)
                .headerTextModifier()
                .padding()
            Text(viewModel.title)
                .itemTextModifier()
            Text(viewModel.ingredientsTitle)
                .itemTextModifier()
                .padding(.top, 10)
                .padding(.bottom, 10)
            ForEach(viewModel.recipes.indices, id:\.self) { index in // show received results
                HStack {
                    Text(viewModel.recipes[index].ingredient)
                        .descriptionTextModifier()
                    Text(viewModel.recipes[index].measure)
                        .descriptionTextModifier()
                }
            }
            Text(viewModel.instructionsTitle)
                .itemTextModifier()
                .padding(.top, 10)
                .padding(.bottom, 10)
            ForEach($viewModel.instructions.indices, id:\.self) { index in // show received results
                Text("\(viewModel.getInstructionLanKey(title:viewModel.instructions[index].0)) : \(viewModel.instructions[index].1)")
                    .descriptionTextModifier()
            }
        }
        .padding(40)
    }
}

struct DetailsContentView_Previews: PreviewProvider {
    static var previews: some View {
        let apiService = ApiService(apiFetcher: ApiFetcher(), networkMonitor: NetworkMonitor.shared)
        let viewModel = DetailsViewModel(drinkId: 15423, apiService: apiService)
        DetailsContentView(viewModel: viewModel)
    }
}
