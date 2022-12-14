//
//  CardListViewModelImpl.swift
//  Card
//
//  Created by Aditi jain on 12/12/22.
//
import Foundation
import SwiftUI
import Combine

class CardListViewModelImpl: ObservableObject {
    
    var outputDelegate: CardListViewModelOutput?
    
    @Published var cards: [Cards] = []
    
    private let useCase: CardListUseCase
    
    func fetchProducts() {
        useCase.getProducts { [weak self] result in
            switch result {
            case .success(let cardsList):
                self?.getData(model: cardsList)
            case .failure(let error):
                self?.outputDelegate?.gotError(error.localizedDescription)
            }
        }
    }
    
    private func getData(model: CardsList) {
        if let data = model.cards{
            cards = data
        }
        outputDelegate?.success()
    }
    
    init(useCase: CardListUseCase) {
        self.useCase = useCase
    }
    
}
