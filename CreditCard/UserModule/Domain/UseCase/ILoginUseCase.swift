//
//  ILoginUseCase.swift
//  Login
//


import Foundation
import PromiseKit

typealias UserResponse = Promise<Bool>

protocol ILoginUseCase {
    func getLogin(email: String, password: String) -> UserResponse
}
