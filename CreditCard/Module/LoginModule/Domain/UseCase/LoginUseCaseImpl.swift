//
//  LoginUseCaseImpl.swift
//

import Foundation

class LoginUseCaseImpl: ILoginUseCase {
    private let repository: ILoginRepository
    
    init(repository: ILoginRepository) {
        self.repository = repository
    }
    
    func getLogin(email: String, password: String, completion: @escaping (Result<[AuthUser], Error>) -> Void) {
        return repository.makeServiceCallToLoginUser(email: email, password: password, completion: completion)
    }
}
