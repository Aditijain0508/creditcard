//
//  CardListServiceImpl.swift
//  Card
//
//  Created by Aditi jain on 12/12/22.
//
import Foundation
import Network

class CardListServiceImpl: CardListService {
    
    
    init() {
    }
    
    func makeNetworkRequest(completion: @escaping (Result<CardsList, Error>) -> Void) {
        
        let contactRequestModel = APIRequestModel(api: CardsListAPI.getCardsData)
        WebserviceHelper.requestAPI(apiModel: contactRequestModel) { response in
            switch response {
            case .success(let serverData):
                do{
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(CardsList.self, from: serverData)
                    completion(.success(responseModel))
                }
                catch{
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

enum CardsListAPI {
    case getCardsData
}

extension CardsListAPI: APIProtocol {
    func httpMthodType() -> HTTPMethodType {
        return .get
    }
    
    func apiEndPath() -> String {
        return CardListAPIEndpoints.listEndPoint
        
    }
    
    func apiBasePath() -> String {
        return WebserviceConstants.baseURL
    }
}


