//
//  CardServiceTest.swift
//
//

import Foundation
import XCTest
@testable import CreditCard

class CardServiceTest: XCTestCase {
    
    var cardListService: CardListServiceImpl!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cardListService = CardListServiceImpl(networkManager: NetworkManager.initObject)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cardListService = nil
    }

    func testFetchProducts_Successs() throws {
       // cardListService.mockGetProducts = Result.success(MockCardList().cardList())
        cardListService.makeNetworkRequest { result in
            switch result {
            case .success(let cardList):
                XCTAssertTrue(cardList.cards?.count ?? 0 > 0)
            case .failure:
                XCTFail("makeServiceCallToGetProducts should not fail")
            }
        }
    }
}
