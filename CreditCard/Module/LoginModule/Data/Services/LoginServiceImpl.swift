//
//  LoginServiceImpl.swift
//

import Foundation

class LoginServiceImpl: ILoginService {
    
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    
    func makeNetworkRequest(email: String, password: String, completion: @escaping (Result<[AuthUser], Error>) -> Void) {
        let request = NetworkRequest(path: APIEndPointConstants.loginEndoint, method: .get, baseUrl: APIEndPointConstants.loginBaseUrl)
        self.networkManager.request(request: request, completion: completion)
    }
}
