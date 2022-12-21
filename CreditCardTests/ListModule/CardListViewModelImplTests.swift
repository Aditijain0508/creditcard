//
//  CardListViewModelImplTests.swift
//  CardTests
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
    var cardListViewModelOutput: MockCardListViewModelOutput!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cardListViewModelOutput = MockCardListViewModelOutput()
        cardListUseCase = MockCardListUseCase()
        cardListViewModel = CardListViewModelImpl(useCase: cardListUseCase)
        cardListViewModel.outputDelegate = cardListViewModelOutput
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cardListUseCase = nil
        cardListViewModel = nil
        cardListViewModelOutput = nil
    }

    func testFetchProducts_Successs() throws {
        cardListUseCase.mockGetProducts = Result.success(MockCardList().cardList())
        cardListViewModel.fetchProducts()
        XCTAssertTrue(cardListViewModel.cardss!.count > 0)
    }

    func testFetchProducts_Failure() throws {
        cardListViewModel.fetchProducts()
        XCTAssertFalse(cardListViewModelOutput.methods.contains("[gotError(_:)]"))
    }
    
}

class MockCardListViewModelOutput: CardListViewModelOutput {
    var methods = [String]()
    func success() {
        methods.append(#function)
    }
    func gotError(_ error: String) {
        methods.append(#function)
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
