//
//  ApiManager.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/20/22.
//

import Foundation
import Combine

actor ApiFetcher {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - ApiFetchable
extension ApiFetcher: ApiFetchable {
    
    // MARK: Fetching data using Combine Framework - reactive approach
    nonisolated func fetchDrinks() -> AnyPublisher<Drinks, ApiError> {
        return fetchData(with: getMainApiComponents())
    }
    
    // MARK: Fetching data using Swift's modern concurrency
    func fetchDrinkDetails(drinkId: Int) async -> Result<DetailsList, ApiError> {
        return await fetchDataWithAsync(with: getDetailsApiComponents(drinkId: drinkId))
    }
    
    nonisolated private func fetchData<T>(with components: URLComponents) -> AnyPublisher<T, ApiError> where T: Decodable {
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
    
    private func fetchDataWithAsync(with components: URLComponents) async -> Result<DetailsList, ApiError> {
        guard let url = components.url else {
            let error = ApiError.invalidURL(description: Constants.invalidUrlMessage)
            return .failure(error)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let responseData = try JSONDecoder().decode(DetailsList.self, from: data)
            return .success(responseData)
        } catch(let error) {
            return .failure(error as! ApiError)
        }
    }
}

// MARK: - API Component
extension ApiFetcher {
    nonisolated func getMainApiComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = MainEndPoint.scheme
        components.host = MainEndPoint.host
        components.path = MainEndPoint.path
        components.queryItems = [
            URLQueryItem(name: MainEndPoint.queryParam, value: MainEndPoint.query)
        ]
        return components
    }
    
    func getDetailsApiComponents(drinkId: Int) -> URLComponents {
        var components = URLComponents()
        components.scheme = DetailsEndPoint.scheme
        components.host = DetailsEndPoint.host
        components.path = DetailsEndPoint.path
        components.queryItems = [
            URLQueryItem(name: DetailsEndPoint.queryParam, value: String(drinkId))
        ]
        return components
    }
}

