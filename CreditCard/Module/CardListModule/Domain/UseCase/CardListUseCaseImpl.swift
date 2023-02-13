//
//  CardListUseCaseImpl.swift
//

import Foundation

class CardListUseCaseImpl: CardListUseCase {
    
    private let repository: CardListRepository
    
    init(repository: CardListRepository) {
        self.repository = repository
    }
    
    func getProducts(completion: @escaping (Result<CardsList, Error>) -> Void) {
        return repository.makeServiceCallToGetProducts(completion: completion)
    }
}
