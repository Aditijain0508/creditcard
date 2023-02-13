//
//  CardListRepository.swift
//  Card
//

import Foundation

protocol CardListRepository {
    func makeServiceCallToGetProducts(completion: @escaping (Result<CardsList, Error>) -> Void)
}
