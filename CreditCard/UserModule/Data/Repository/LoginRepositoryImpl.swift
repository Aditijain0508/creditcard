//
//  LoginRepositoryImpl.swift
//  Login
//

import Foundation

class LoginRepositoryImpl: ILoginRepository {
    
    private let service: ILoginService
    
    init(service: ILoginService) {
        self.service = service
    }
    
    func makeServiceCallToLoginUser(email: String, password: String, completion: @escaping (Result<[AuthUser], Error>) -> Void) {
        return service.makeNetworkRequest(email: email, password: password, completion: completion)
    }
    
}
