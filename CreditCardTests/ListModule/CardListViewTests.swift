//
//  CardListViewTests.swift
//  CreditCardUITests
//
//  Created by Aditi Jain 3 on 15/02/23.
//

import XCTest
import ViewInspector
@testable import CreditCard

class CardListViewTests: XCTestCase {
    
    var cardListViewModel: CardListViewModelImpl!
    var cardListUseCase: MockCardListUseCase!

    override func setUpWithError() throws {
        cardListUseCase = MockCardListUseCase()
        cardListViewModel = CardListViewModelImpl(useCase: cardListUseCase)
        cardListViewModel.cardss = MockCardList().cardList().cards
    }

    func testListCard() throws {
        if let card = cardListViewModel.cardss?[0] {
            let subject = CardsView(cards: card)
            let value = try subject.inspect().vStack().hStack(0).vStack(1).text(0).string()
            XCTAssertEqual(value, "Title")
        }
    }
    
    func testList() throws {
        let subject = CardListView(listViewModel: cardListViewModel)
        let value = try subject.inspect().vStack().list(0)
        XCTAssertNotNil(value)
    }

}
