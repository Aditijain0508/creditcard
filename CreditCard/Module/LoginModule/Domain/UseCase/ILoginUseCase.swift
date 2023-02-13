//
//  ILoginUseCase.swift
//

import Foundation

protocol ILoginUseCase {
    func getLogin(email: String, password: String, completion: @escaping (Result<[AuthUser], Error>) -> Void)
}
