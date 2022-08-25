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
    var sut: URLSession!
    let networkMonitor = NetworkMonitor.shared
    var apiService: MockApiService!
    var mockApiProvider: MockAPIProvider!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = URLSession(configuration: .default)
        apiService = MockApiService()
        mockApiProvider = MockAPIProvider()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_Mapping_Data_With_ValidRequest_Returns_ValidResponse() throws {
        try XCTSkipUnless(
            networkMonitor.isReachable,
            "Network connectivity needed for this test."
        )
        
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
    
    
    func test_Mock_Data_With_ValidRequest_Returns_ValidResponse() throws {
        try XCTSkipUnless(
            networkMonitor.isReachable,
            "Network connectivity needed for this test."
        )
        
        let url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
        
        // ARRANGE
        var disposables = Set<AnyCancellable>()
        let expectation = self.expectation(description: "ValidRequest_Returns_ValidResponse")

        // ACT
        let res = mockApiProvider.apiResponse(for: URLRequest(url: URL(string: url)!))
        res.sink(
            receiveCompletion: { [weak self] value in
                guard self != nil else { return }
                switch value {
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
            },
            receiveValue: { [weak self] res in
                guard self != nil else { return }
                print(res.data)
                // ASSERT
                XCTAssertNotNil(res)
                expectation.fulfill()
            })
        .store(in: &disposables)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func fetch_data_with_success_mock_api_call() {

        // given
        let drinks: Drinks = Bundle.main.decode("drinks.json")
        apiService.fetchedResults = CurrentValueSubject(drinks).eraseToAnyPublisher()
        
        // ASSERT
        XCTAssertNotNil(apiService.fetchDrinks)

    }
}

class MockApiService: ApiFetchable {
    
    var fetchedResults: AnyPublisher<Drinks, ApiError>?
    
    func fetchDrinks() -> AnyPublisher<Drinks, ApiError> {
        if let result = fetchedResults {
            return result
        } else {
            fatalError(ApiError.decoding(description: "Result must not be nil!").localizedDescription)
        }
    }
    
    func fetchDrinkDetails(drinkId: Int) async -> Result<DetailsList, ApiError> {
        fatalError(ApiError.decoding(description: "Result must not be nil!").localizedDescription)
    }

}

struct MockAPIProvider: APIProvider {
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
        let data = "Hello, world!".data(using: .utf8)!
        return Just((data: data, response: response))
            .setFailureType(to: URLError.self)
            .eraseToAnyPublisher()
    }
}
