//
//  ApiManager.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/20/22.
//

import SwiftUI
import Combine

@MainActor class ApiService: ObservableObject {
    
    @Published var dataSource: [DrinkViewModel] = []
    
    private let apiFetcher: ApiFetchable
    private let networkMonitor: NetworkMonitor
    private var disposables = Set<AnyCancellable>()
    
    init(apiFetcher: ApiFetchable, networkMonitor: NetworkMonitor) {
        self.apiFetcher = apiFetcher
        self.networkMonitor = networkMonitor
        if self.networkMonitor.isReachable {
            self.getAllDrinks()
        } else {
            // MARK: Get data from local database while offline
            print("Offline")
        }
    }
    
    // MARK: Fetching data using Combine Framework - reactive approach
    func getAllDrinks() {
        apiFetcher.fetchDrinks()
            .map { response in
                response.allDrinks.map(DrinkViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure(let error):
                        self.dataSource = []
                        print("Error: \(error.localizedDescription)")
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] drinkViewModels in
                    guard let self = self else { return }
                    self.dataSource.append(contentsOf: drinkViewModels)
                    
                    // MARK: Save data for offline support
                    self.saveDataIntoLocalDatabase()
                })
            .store(in: &disposables)
    }
    
    // MARK: Fetching data using Swift's modern concurrency
    func fetchDrinkDetails(drinkId: Int) async -> Result<DetailsList, ApiError> {
        if self.networkMonitor.isReachable {
            return await apiFetcher.fetchDrinkDetails(drinkId: drinkId)
        }
        return .failure(ApiError.offline)
    }
    
    // MARK: Save Into Local DB
    func saveDataIntoLocalDatabase() {
        guard self.dataSource.count > 0 else { return }
    }
}
