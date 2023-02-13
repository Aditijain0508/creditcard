//
//  CardListViewModelImplTests.swift
//

import Foundation
import XCTest
@testable import CreditCard

enum CardListViewModelError: Error {
    case emptyArray
}
class CardListViewModelImplTests: XCTestCase {

    var cardListViewModel: CardListViewModelImpl!
    var cardListUseCase: MockCardListUseCase!
    private var promise: XCTestExpectation!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cardListUseCase = MockCardListUseCase()
        cardListViewModel = CardListViewModelImpl(useCase: cardListUseCase)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cardListUseCase = nil
        cardListViewModel = nil
    }

    func testFetchProducts_Successs() throws {
        let expectation = expectation(description: "Success Response")
        cardListUseCase.mockGetProducts = Result.success(MockCardList().cardList())
        cardListViewModel.fetchProducts()
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertTrue(cardListViewModel.cardss?.count ?? 0 > 0)
    }

    func testFetchProducts_Failure() throws {
        cardListViewModel.fetchProducts()
        XCTAssertTrue(cardListViewModel.cardss?.count ?? 0 == 0)
    }
    
}

class MockCardListUseCase: CardListUseCase {
    var mockGetProducts: Result<CardsList, Error>?
    func getProducts(completion: @escaping (Result<CardsList, Error>) -> Void) {
        completion(mockGetProducts ?? .failure(CardListViewModelError.emptyArray))
    }
}

class MockCardList {
    func cardList() -> CardsList {
        let card1 = Cards(id: "1", title: "Title", cardsdescription: "Description", thumbnail: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")
        let card2 = Cards(id: "1", title: "Title", cardsdescription: "Description", thumbnail: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")
        let card3 = Cards(id: "1", title: "Title", cardsdescription: "Description", thumbnail: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")
        let card4 = Cards(id: "1", title: "Title", cardsdescription: "Description", thumbnail: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")
        let card5 = Cards(id: "1", title: "Title", cardsdescription: "Description", thumbnail: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")
        let card6 = Cards(id: "1", title: "Title", cardsdescription: "Description", thumbnail: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")
        let card7 = Cards(id: "1", title: "Title", cardsdescription: "Description", thumbnail: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")
        return CardsList(cards: [card1, card2, card3, card4, card5, card6, card7])
    }
}
