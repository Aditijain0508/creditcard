//
//  ILoginRepository.swift
//

import Foundation

protocol ILoginRepository {
    func makeServiceCallToLoginUser(email: String, password: String, completion: @escaping (Result<[AuthUser], Error>) -> Void)

}
