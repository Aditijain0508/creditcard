//
//  MockUseCase.swift
//  LoginTests
//


import Foundation
import PromiseKit

class MockUseCase: ILoginUseCase {
    var error: Error?
    
    func getLogin(email: String, password: String) -> UserResponse {
        return Promise { seal in
            if let error = error {
                seal.reject(error)
            } else {
                seal.fulfill(true)
            }
        }
    }
}
