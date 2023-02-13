//
//  CardListUseCase.swift
//

import Foundation

protocol CardListUseCase {
    func getProducts(completion: @escaping (Result<CardsList, Error>) -> Void)
}
