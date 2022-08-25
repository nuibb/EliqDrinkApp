//
//  ViewModelUnitTests.swift
//  EliqDrinkAppTests
//
//  Created by ReliSource Technologies Ltd. on 8/25/22.
//

import XCTest
@testable import EliqDrinkApp

class ViewModelUnitTests: XCTestCase {
    var sut: DetailsViewModel!
    let id = 15423

    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let apiService = ApiService(apiFetcher: ApiFetcher(), networkMonitor: NetworkMonitor.shared)
        sut = DetailsViewModel(drinkId:id, apiService: apiService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func test_drink_name_always_return_valid_text() throws {
        let expectation = self.expectation(description: "ValidInput_Returns_ValidOutput")
        let detailsList: DetailsList = Bundle.main.decode("details.json")
        
        // ACT
        sut.drinkDetailsList = detailsList.objects
        sut.getAllIngredients()
        
        // ASSERT
        XCTAssertNotNil(sut)
        XCTAssertNotNil(detailsList)
        XCTAssertNotEqual(detailsList.objects.count, 0)
        XCTAssertNotEqual(sut.drinkDetailsList.count, 0)
        XCTAssertEqual(detailsList.objects.first?.strCategory, sut.category)
        
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_drink_title_always_return_valid_text() throws {
        let expectation = self.expectation(description: "ValidInput_Returns_ValidOutput")
        let detailsList: DetailsList = Bundle.main.decode("details.json")
        
        // ACT
        sut.drinkDetailsList = detailsList.objects
        sut.getAllIngredients()
        
        // ASSERT
        XCTAssertNotNil(sut)
        XCTAssertNotNil(detailsList)
        XCTAssertNotEqual(detailsList.objects.count, 0)
        XCTAssertNotEqual(sut.drinkDetailsList.count, 0)
        XCTAssertEqual(detailsList.objects.first?.strDrink, sut.title)
        
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)
    }

}
