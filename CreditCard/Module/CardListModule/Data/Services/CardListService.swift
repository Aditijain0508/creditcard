//
//  CardListService.swift
//

import Foundation

protocol CardListService {
    func makeNetworkRequest(completion: @escaping (Result<CardsList, Error>) -> Void)
}
