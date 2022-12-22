//
//  ILoginService.swift
//  Login
//

import Foundation

protocol ILoginService {
    func makeNetworkRequest(email: String, password: String, completion: @escaping (Result<[AuthUser], Error>) -> Void)
}
