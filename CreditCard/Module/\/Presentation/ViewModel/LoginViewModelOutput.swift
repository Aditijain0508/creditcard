//
//  LoginViewModelOutput.swift
//

import Foundation

protocol LoginViewModelOutput {
    func success()
    func gotError(_ error: String)
}
