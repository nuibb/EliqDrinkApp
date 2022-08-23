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
    
    init(drinkId: Int, apiService: ApiService) {
        self.drinkId = drinkId
        self.apiService = apiService
    }
    
    func fetchDrinkdetailsData() async {
        let results: Result<DetailsList, ApiError> = await self.apiService.fetchDrinkDetails(drinkId: drinkId)
        guard case .success(let detailsList) = results else { return }
        guard let objects = detailsList.objects, objects.count > 0 else { return }
        self.drinkDetailsList = objects
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
    
    var instruction: String {
        guard drinkDetailsList.count > 0, let drinkDetails = drinkDetailsList.first else {return ""}
        return drinkDetails.strInstructions ?? ""
    }
    
    var ingredientMeasurementTitle: String {
        guard drinkDetailsList.count > 0, recipes.count > 0 else { return ""}
        return Constants.ingredientMeasurementText
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
            guard let label = label, value is String else { continue }
            if label.contains("Ingredient") {
                ingredients.append([label: value as! String])
            } else if label.contains("Measure") {
                measures.append([label: value as! String])
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
