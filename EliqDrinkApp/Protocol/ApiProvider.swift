//
//  ApiProvider.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/24/22.
//

import Foundation
import Combine

protocol APIProvider {
    typealias APIResponse = URLSession.DataTaskPublisher.Output
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError>
}

extension URLSession: APIProvider {
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        return dataTaskPublisher(for: request).eraseToAnyPublisher()
    }
}

