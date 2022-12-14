//
//  CardListRepositoryImplTests.swift
//  CardTests
//

import Foundation
import XCTest
@testable import CreditCard


class CardListRepositoryImplTests: XCTestCase {
    
    var cardListService: MockCardListService!
    var cardListRepositoryImpl: CardListRepositoryImpl!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cardListService = MockCardListService()
        cardListRepositoryImpl = CardListRepositoryImpl(service: cardListService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cardListService = nil
        cardListRepositoryImpl = nil
    }

    func testFetchProducts_Successs() throws {
        cardListService.mockGetProducts = Result.success(MockCardList().cardList())
        cardListRepositoryImpl.makeServiceCallToGetProducts { result in
            switch result {
            case .success(let cardList):
                XCTAssertTrue(cardList.cards.count > 0)
            case .failure(_):
                XCTFail("makeServiceCallToGetProducts should not fail")
            }
        }
    }
    
    func testFetchProducts_Failure() throws {
        cardListRepositoryImpl.makeServiceCallToGetProducts { result in
            switch result {
            case .success(_):
                XCTFail("makeServiceCallToGetProducts should be fail")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }
}

class MockCardListService: CardListService {
    var mockGetProducts: Result<CardsList, Error>?
    func makeNetworkRequest(completion: @escaping (Result<CardsList, Error>) -> Void) {
        completion(mockGetProducts ?? .failure(CardListViewModelError.emptyArray))
    }
}

