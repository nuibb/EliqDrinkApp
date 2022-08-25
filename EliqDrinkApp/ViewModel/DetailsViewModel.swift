//
//  DetailsViewModel.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/21/22.
//

import Foundation
import SwiftUI

class DetailsViewModel: Identifiable, ObservableObject {
    
    // MARK: Properties
    private let drinkId: Int
    private let apiService: ApiService
    @Published var drinkDetailsList: [DrinkDetails] = []
    
    // List of recipes to show in UI
    var recipes: [Recipe] = []
    var instructions: [(key:String, value:String)] = []
    
    init(drinkId: Int, apiService: ApiService) {
        self.drinkId = drinkId
        self.apiService = apiService
    }
    
    func fetchDrinkdetailsData() async {
        let results: Result<DetailsList, ApiError> = await self.apiService.fetchDrinkDetails(drinkId: drinkId)
        guard case .success(let detailsList) = results else { return }
        guard detailsList.objects.count > 0 else { return }
        self.drinkDetailsList = detailsList.objects
        self.getAllIngredients()
    }
    
    var id: Int {
        guard drinkDetailsList.count > 0, let drinkDetails = drinkDetailsList.first else {return 0}
        return Int(drinkDetails.idDrink ?? "0")!
    }
    
    var category: String {
        guard drinkDetailsList.count > 0, let drinkDetails = drinkDetailsList.first else {return ""}
        return drinkDetails.strCategory ?? ""
    }
    
    var title: String {
        guard drinkDetailsList.count > 0, let drinkDetails = drinkDetailsList.first else {return ""}
        return drinkDetails.strDrink ?? ""
    }
    
    func getInstructionLanKey(title: String) -> String {
        guard let text = title.components(separatedBy: "Instructions").last, !text.isEmpty else { return "EN" }
        return text
    }
    
    var ingredientsTitle: String {
        guard drinkDetailsList.count > 0, recipes.count > 0 else { return ""}
        return Constants.ingredientsText
    }
    
    var instructionsTitle: String {
        guard instructions.count > 0 else { return ""}
        return Constants.instructionsText
    }
    
    var thumbUrl: String {
        guard drinkDetailsList.count > 0, let drinkDetails = drinkDetailsList.first else {return ""}
        return drinkDetails.strDrinkThumb ?? ""
    }
    
    func getAllIngredients() {
        guard drinkDetailsList.count > 0, let drinkDetails = drinkDetailsList.first else { return }
        let drinkDetailsMirror = Mirror(reflecting: drinkDetails)
        var ingredients: [[String: String]] = []
        var measures: [[String: String]] = []
        for (label, value) in drinkDetailsMirror.children {
            guard let label = label, let value = value as? String else { continue }
            if label.contains("Ingredient") && !value.isEmpty {
                ingredients.append([label : value ])
            } else if label.contains("Measure") && !value.isEmpty {
                measures.append([label : value ])
            } else if label.contains("Instructions") && !value.isEmpty {
                self.instructions.append((key: label, value: value))
            }
        }
        
        // Return if number of ingredients and measures properties coming from API doesn't match
        if ingredients.count != measures.count { return }
        
        for ingredient in ingredients {
            guard let ingKey = ingredient.keys.first, let ingValue = ingredient[ingKey] else { continue }
            let stringNumber = ingKey.suffix(1)
            if let number = Int(stringNumber) {
                let filteredMeasures = measures.filter { $0.keys.contains("strMeasure\(number)") }.flatMap { $0 }
                guard let measure = filteredMeasures.first else { continue }
                let recipe = Recipe(id: number, ingredient: ingValue, measure: measure.value)
                self.recipes.append(recipe)
            }
        }
    }
}
