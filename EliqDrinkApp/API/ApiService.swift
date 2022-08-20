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
    //private let networkManager = NetworkManager.shared
    //private let networkMonitor = NetworkMonitor.shared
    
    //Dependancy Injection
    init(apiFetcher: ApiFetchable, networkMonitor: NetworkMonitor) {
        self.apiFetcher = apiFetcher
        self.networkMonitor = networkMonitor
        if self.networkMonitor.isReachable {
            self.getAllDrinks()
        } else {
            //From DB
        }
    }
    
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
                })
            .store(in: &disposables)
    }
    
    
}
