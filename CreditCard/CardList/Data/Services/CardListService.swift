//
//  CardListService.swift
//  Card
//
//  Created by Aditi jain on 12/12/22.
//
import Foundation

protocol CardListService {
    func makeNetworkRequest(completion: @escaping (Result<CardsList, Error>) -> Void)
}
