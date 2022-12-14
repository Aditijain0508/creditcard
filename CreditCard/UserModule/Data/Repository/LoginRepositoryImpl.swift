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
    
    func makeServiceCallToLoginUser(email: String, password: String) -> UserResponse {
        return service.makeNetworkRequest(email: email, password: password)
    }
    
}
