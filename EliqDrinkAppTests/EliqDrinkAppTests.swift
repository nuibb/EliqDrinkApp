//
//  EliqDrinkAppTests.swift
//  EliqDrinkAppTests
//
//  Created by ReliSource Technologies Ltd. on 8/19/22.
//

import XCTest
@testable import EliqDrinkApp
import Combine

class EliqDrinkAppTests: XCTestCase {

    func test_UnsplashApiResource_With_ValidRequest_Returns_ValidResponse() {

        // ARRANGE
        var dataSource: [DrinkViewModel] = []
        var disposables = Set<AnyCancellable>()
        let fetcher = ApiFetcher()
        let expectation = self.expectation(description: "ValidRequest_Returns_ValidResponse")

        // ACT
        fetcher.fetchDrinks()
            .map { response in
                response.allDrinks.map(DrinkViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard self != nil else { return }
                    switch value {
                    case .failure(let error):
                        dataSource = []
                        print("Error: \(error.localizedDescription)")
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] drinkViewModels in
                    guard self != nil else { return }
                    dataSource.append(contentsOf: drinkViewModels)
                    
                    // ASSERT
                    XCTAssertNotNil(dataSource)
                    XCTAssertNotEqual(0, dataSource.count)
                    expectation.fulfill()
                })
            .store(in: &disposables)
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
