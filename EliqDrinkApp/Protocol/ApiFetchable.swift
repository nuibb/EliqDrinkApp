//
//  ApiManagerFetchable.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/20/22.
//

import Foundation
import Combine

protocol ApiFetchable {
    func fetchDrinks() -> AnyPublisher<Drinks, ApiError>
}

