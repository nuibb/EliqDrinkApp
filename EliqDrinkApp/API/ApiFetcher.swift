//
//  ApiManager.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/20/22.
//

import Foundation
import Combine

class ApiFetcher {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - ApiFetchable
extension ApiFetcher: ApiFetchable {
    
    func fetchDrinks() -> AnyPublisher<Drinks, ApiError> {
        return fetchData(with: getApiComponents())
    }
    
    private func fetchData<T>(with components: URLComponents) -> AnyPublisher<T, ApiError> where T: Decodable {
        guard let url = components.url else {
            let error = ApiError.invalidURL(description: Constants.invalidUrlMessage)
            return Fail(error: error).eraseToAnyPublisher()
        }
        //print(url)
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                    .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - API Component
extension ApiFetcher {
    func getApiComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = EndPoint.scheme
        components.host = EndPoint.host
        components.path = EndPoint.path
        components.queryItems = [
            URLQueryItem(name: EndPoint.queryParam, value: EndPoint.query)
        ]
        return components
    }
}

