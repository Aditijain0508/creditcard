//
//  CardListRepository.swift
//  Card
//
//  Created by Aditi jain on 12/12/22.
//
import Foundation

protocol CardListRepository {
    func makeServiceCallToGetProducts(completion: @escaping (Result<CardsList, Error>) -> Void)
}
