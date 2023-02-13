//
//  ILoginService.swift
//

import Foundation

protocol ILoginService {
    func makeNetworkRequest(email: String, password: String, completion: @escaping (Result<[AuthUser], Error>) -> Void)
}
