//
//  cardsList.swift
//  Card
//
//  Created by Aditi jain on 12/12/22.
//
import Foundation

struct CardsList: Codable {
    var cards: [Cards]?
}

struct Cards: Codable, Hashable {
    let id: String
    let title: String
    let cardsdescription: String
    let thumbnail: String
}
