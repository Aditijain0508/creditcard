//
//  CardListTest.swift
//

import XCTest
@testable import CreditCard

class CardListTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testCardModule() {
        let cardVc = CreditCardRouter.routeToCardModule()
        XCTAssertNotNil(cardVc)
    }

}
