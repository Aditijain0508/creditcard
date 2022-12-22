//
//  CardListServiceImpl.swift
//  Card
//
//  Created by Aditi jain on 12/12/22.
//
import Foundation

class CardListServiceImpl: CardListService {
    
    
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    
    func makeNetworkRequest(completion: @escaping (Result<CardsList, Error>) -> Void) {
        let request = NetworkRequest(path: CardListAPIEndpoints.listEndPoint, method: .get, baseUrl: CardListAPIEndpoints.listBaseUrl )
        self.networkManager.request(request: request, completion: completion)
    }
    
}

