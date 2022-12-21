//
//  ILoginViewModel.swift
//  Login
//

import Foundation

protocol ILoginViewModel: ObservableObject {
    var isLoading:Bool { get set }
    func login(email: String, password: String)
    var outputDelegate: LoginViewModelOutput? { get set }
}
