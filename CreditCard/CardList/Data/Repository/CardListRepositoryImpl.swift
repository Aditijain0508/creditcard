//
//  CardListRepositoryImpl.swift
//  Card
//
//  Created by Aditi jain on 12/12/22.
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
