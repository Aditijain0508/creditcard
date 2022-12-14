//
//  ILoginRepository.swift
//  User
//


import Foundation

protocol ILoginRepository {
    func makeServiceCallToLoginUser(email: String, password: String) -> UserResponse
}
