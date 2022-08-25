//
//  DrinkRecipe.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/20/22.
//

import Foundation

struct DetailsList : Decodable {
    let objects : [DrinkDetails]?

    enum CodingKeys: String, CodingKey {
        case objects = "drinks"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        objects = try values.decodeIfPresent([DrinkDetails].self, forKey: .objects)
    }
}

struct DrinkDetails : Decodable {
    let idDrink : String?
    let strDrink : String?
    var strDrinkAlternate : String?
    var strTags : String?
    var strVideo : String?
    let strCategory : String?
    var strIBA : String?
    var strAlcoholic : String?
    var strGlass : String?
    let strInstructions : String?
    var strInstructionsES : String?
    var strInstructionsDE : String?
    var strInstructionsFR : String?
    var strInstructionsIT : String?
    var strInstructionsZH_HANS : String?
    var strInstructionsZH_HANT : String?
    var strDrinkThumb : String?
    var strIngredient1 : String?
    var strIngredient2 : String?
    var strIngredient3 : String?
    var strIngredient4 : String?
    var strIngredient5 : String?
    var strIngredient6 : String?
    var strIngredient7 : String?
    var strIngredient8 : String?
    var strIngredient9 : String?
    var strIngredient10 : String?
    var strIngredient11 : String?
    var strIngredient12 : String?
    var strIngredient13 : String?
    var strIngredient14 : String?
    var strIngredient15 : String?
    var strMeasure1 : String?
    var strMeasure2 : String?
    var strMeasure3 : String?
    var strMeasure4 : String?
    var strMeasure5 : String?
    var strMeasure6 : String?
    var strMeasure7 : String?
    var strMeasure8 : String?
    var strMeasure9 : String?
    var strMeasure10 : String?
    var strMeasure11 : String?
    var strMeasure12 : String?
    var strMeasure13 : String?
    var strMeasure14 : String?
    var strMeasure15 : String?
    var strImageSource : String?
    var strImageAttribution : String?
    var strCreativeCommonsConfirmed : String?
    var dateModified : String?
    
    init(idDrink: String, strDrink: String, strCategory: String, strInstructions: String, strDrinkThumb: String) {
        self.idDrink = idDrink
        self.strDrink = strDrink
        self.strCategory = strCategory
        self.strInstructions = strInstructions
        self.strDrinkThumb = strDrinkThumb
    }

    enum CodingKeys: String, CodingKey {

        case idDrink = "idDrink"
        case strDrink = "strDrink"
        case strDrinkAlternate = "strDrinkAlternate"
        case strTags = "strTags"
        case strVideo = "strVideo"
        case strCategory = "strCategory"
        case strIBA = "strIBA"
        case strAlcoholic = "strAlcoholic"
        case strGlass = "strGlass"
        case strInstructions = "strInstructions"
        case strInstructionsES = "strInstructionsES"
        case strInstructionsDE = "strInstructionsDE"
        case strInstructionsFR = "strInstructionsFR"
        case strInstructionsIT = "strInstructionsIT"
        case strInstructionsZH_HANS = "strInstructionsZH-HANS"
        case strInstructionsZH_HANT = "strInstructionsZH-HANT"
        case strDrinkThumb = "strDrinkThumb"
        case strIngredient1 = "strIngredient1"
        case strIngredient2 = "strIngredient2"
        case strIngredient3 = "strIngredient3"
        case strIngredient4 = "strIngredient4"
        case strIngredient5 = "strIngredient5"
        case strIngredient6 = "strIngredient6"
        case strIngredient7 = "strIngredient7"
        case strIngredient8 = "strIngredient8"
        case strIngredient9 = "strIngredient9"
        case strIngredient10 = "strIngredient10"
        case strIngredient11 = "strIngredient11"
        case strIngredient12 = "strIngredient12"
        case strIngredient13 = "strIngredient13"
        case strIngredient14 = "strIngredient14"
        case strIngredient15 = "strIngredient15"
        case strMeasure1 = "strMeasure1"
        case strMeasure2 = "strMeasure2"
        case strMeasure3 = "strMeasure3"
        case strMeasure4 = "strMeasure4"
        case strMeasure5 = "strMeasure5"
        case strMeasure6 = "strMeasure6"
        case strMeasure7 = "strMeasure7"
        case strMeasure8 = "strMeasure8"
        case strMeasure9 = "strMeasure9"
        case strMeasure10 = "strMeasure10"
        case strMeasure11 = "strMeasure11"
        case strMeasure12 = "strMeasure12"
        case strMeasure13 = "strMeasure13"
        case strMeasure14 = "strMeasure14"
        case strMeasure15 = "strMeasure15"
        case strImageSource = "strImageSource"
        case strImageAttribution = "strImageAttribution"
        case strCreativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        idDrink = try values.decodeIfPresent(String.self, forKey: .idDrink)
        strDrink = try values.decodeIfPresent(String.self, forKey: .strDrink)
        strDrinkAlternate = try values.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
        strTags = try values.decodeIfPresent(String.self, forKey: .strTags)
        strVideo = try values.decodeIfPresent(String.self, forKey: .strVideo)
        strCategory = try values.decodeIfPresent(String.self, forKey: .strCategory)
        strIBA = try values.decodeIfPresent(String.self, forKey: .strIBA)
        strAlcoholic = try values.decodeIfPresent(String.self, forKey: .strAlcoholic)
        strGlass = try values.decodeIfPresent(String.self, forKey: .strGlass)
        strInstructions = try values.decodeIfPresent(String.self, forKey: .strInstructions)
        strInstructionsES = try values.decodeIfPresent(String.self, forKey: .strInstructionsES)
        strInstructionsDE = try values.decodeIfPresent(String.self, forKey: .strInstructionsDE)
        strInstructionsFR = try values.decodeIfPresent(String.self, forKey: .strInstructionsFR)
        strInstructionsIT = try values.decodeIfPresent(String.self, forKey: .strInstructionsIT)
        strInstructionsZH_HANS = try values.decodeIfPresent(String.self, forKey: .strInstructionsZH_HANS)
        strInstructionsZH_HANT = try values.decodeIfPresent(String.self, forKey: .strInstructionsZH_HANT)
        strDrinkThumb = try values.decodeIfPresent(String.self, forKey: .strDrinkThumb)
        strIngredient1 = try values.decodeIfPresent(String.self, forKey: .strIngredient1)
        strIngredient2 = try values.decodeIfPresent(String.self, forKey: .strIngredient2)
        strIngredient3 = try values.decodeIfPresent(String.self, forKey: .strIngredient3)
        strIngredient4 = try values.decodeIfPresent(String.self, forKey: .strIngredient4)
        strIngredient5 = try values.decodeIfPresent(String.self, forKey: .strIngredient5)
        strIngredient6 = try values.decodeIfPresent(String.self, forKey: .strIngredient6)
        strIngredient7 = try values.decodeIfPresent(String.self, forKey: .strIngredient7)
        strIngredient8 = try values.decodeIfPresent(String.self, forKey: .strIngredient8)
        strIngredient9 = try values.decodeIfPresent(String.self, forKey: .strIngredient9)
        strIngredient10 = try values.decodeIfPresent(String.self, forKey: .strIngredient10)
        strIngredient11 = try values.decodeIfPresent(String.self, forKey: .strIngredient11)
        strIngredient12 = try values.decodeIfPresent(String.self, forKey: .strIngredient12)
        strIngredient13 = try values.decodeIfPresent(String.self, forKey: .strIngredient13)
        strIngredient14 = try values.decodeIfPresent(String.self, forKey: .strIngredient14)
        strIngredient15 = try values.decodeIfPresent(String.self, forKey: .strIngredient15)
        strMeasure1 = try values.decodeIfPresent(String.self, forKey: .strMeasure1)
        strMeasure2 = try values.decodeIfPresent(String.self, forKey: .strMeasure2)
        strMeasure3 = try values.decodeIfPresent(String.self, forKey: .strMeasure3)
        strMeasure4 = try values.decodeIfPresent(String.self, forKey: .strMeasure4)
        strMeasure5 = try values.decodeIfPresent(String.self, forKey: .strMeasure5)
        strMeasure6 = try values.decodeIfPresent(String.self, forKey: .strMeasure6)
        strMeasure7 = try values.decodeIfPresent(String.self, forKey: .strMeasure7)
        strMeasure8 = try values.decodeIfPresent(String.self, forKey: .strMeasure8)
        strMeasure9 = try values.decodeIfPresent(String.self, forKey: .strMeasure9)
        strMeasure10 = try values.decodeIfPresent(String.self, forKey: .strMeasure10)
        strMeasure11 = try values.decodeIfPresent(String.self, forKey: .strMeasure11)
        strMeasure12 = try values.decodeIfPresent(String.self, forKey: .strMeasure12)
        strMeasure13 = try values.decodeIfPresent(String.self, forKey: .strMeasure13)
        strMeasure14 = try values.decodeIfPresent(String.self, forKey: .strMeasure14)
        strMeasure15 = try values.decodeIfPresent(String.self, forKey: .strMeasure15)
        strImageSource = try values.decodeIfPresent(String.self, forKey: .strImageSource)
        strImageAttribution = try values.decodeIfPresent(String.self, forKey: .strImageAttribution)
        strCreativeCommonsConfirmed = try values.decodeIfPresent(String.self, forKey: .strCreativeCommonsConfirmed)
        dateModified = try values.decodeIfPresent(String.self, forKey: .dateModified)
    }

}

