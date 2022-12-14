//
//  LoginViewModelOutput.swift
//  Login
//


import Foundation

protocol LoginViewModelOutput {
    func success()
    func gotError(_ error: String)
}
