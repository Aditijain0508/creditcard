//
//  CardListViewModelImpl.swift
//

import Foundation
import SwiftUI
import Combine

class CardListViewModelImpl: CardListViewModel {
    @Published var cardss: [Cards]?
    
    private let useCase: CardListUseCase
    
    func fetchProducts() {
        useCase.getProducts { [weak self] result in
            switch result {
            case .success(let cardsList):
                self?.getData(model: cardsList)
            case .failure:
                return
            }
        }
    }
    
    private func getData(model: CardsList) {
        DispatchQueue.main.async {  [weak self] in
            if let data = model.cards {
                self?.cardss = data
            }
        }
    }
    
    init(useCase: CardListUseCase) {
        self.useCase = useCase
    }
    
}
