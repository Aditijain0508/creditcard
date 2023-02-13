//
//  CardListRepositoryImpl.swift
//

import Foundation

class CardListRepositoryImpl: CardListRepository {
    
    private let service: CardListService
    
    init(service: CardListService) {
        self.service = service
    }
    
    func makeServiceCallToGetProducts(completion: @escaping (Result<CardsList, Error>) -> Void) {
        return service.makeNetworkRequest(completion: completion)
    }
    
}
