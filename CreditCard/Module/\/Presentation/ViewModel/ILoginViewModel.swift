//
//  ILoginViewModel.swift
//

import Foundation

protocol ILoginViewModel: ObservableObject {
    var isLoading: Bool { get set }
    func login(email: String, password: String)
    var outputDelegate: LoginViewModelOutput? { get set }
}
