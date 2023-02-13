//
//  CardListUseCaseImplTests.swift
//

import Foundation
import XCTest
@testable import CreditCard

class CardListUseCaseImplTests: XCTestCase {
    
    var cardListUseCaseImpl: CardListUseCaseImpl!
    var cardListRepository: MockCardListRepository!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cardListRepository = MockCardListRepository()
        cardListUseCaseImpl = CardListUseCaseImpl(repository: cardListRepository)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cardListUseCaseImpl = nil
        cardListRepository = nil
    }

    func testFetchProducts_Successs() throws {
        cardListRepository.mockGetProducts = Result.success(MockCardList().cardList())
        cardListUseCaseImpl.getProducts { result in
            switch result {
            case .success(let cardList):
                XCTAssertTrue(cardList.cards?.count ?? 0 > 0)
            case .failure(_):
                XCTFail("getProducts should not fail")
            }
        }
    }
    
    func testFetchProducts_Failure() throws {
        cardListUseCaseImpl.getProducts { result in
            switch result {
            case .success(_):
                XCTFail("getProducts should be fail")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }
}

class MockCardListRepository: CardListRepository {
    var mockGetProducts: Result<CardsList, Error>?
    func makeServiceCallToGetProducts(completion: @escaping (Result<CardsList, Error>) -> Void) {
        completion(mockGetProducts ?? .failure(CardListViewModelError.emptyArray))
    }
}
