//
//  ILoginViewModel.swift
//  Login
//

import Foundation

protocol ILoginViewModel {
    func login(email: String, password: String)
    var outputDelegate: LoginViewModelOutput? { get set }
}
