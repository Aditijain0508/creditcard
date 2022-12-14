//
//  LoginUseCaseImpl.swift
//  Login
//


import Foundation

class LoginUseCaseImpl: ILoginUseCase {
    private let repository: ILoginRepository
    
    init(repository: ILoginRepository) {
        self.repository = repository
    }
    
    func getLogin(email: String, password: String) -> UserResponse {
        return repository.makeServiceCallToLoginUser(email: email, password: password)
    }
}
