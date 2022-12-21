//
//  CardListViewModelImpl.swift
//  Card
//
//  Created by Aditi jain on 12/12/22.
//
import Foundation
import SwiftUI
import Combine

class CardListViewModelImpl: CardListViewModel {
    @Published var cardss: [Cards]?
    
    var outputDelegate: CardListViewModelOutput?
    
    
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
            cardss = data
        }
        outputDelegate?.success()
    }
    
    init(useCase: CardListUseCase) {
        self.useCase = useCase
    }
    
}
