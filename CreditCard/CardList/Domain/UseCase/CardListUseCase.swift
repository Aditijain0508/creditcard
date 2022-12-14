//
//  CardListUseCase.swift
//  Card
//
//  Created by Aditi jain on 12/12/22.
//
import Foundation

protocol CardListUseCase {
    func getProducts(completion: @escaping (Result<CardsList, Error>) -> Void)
}
