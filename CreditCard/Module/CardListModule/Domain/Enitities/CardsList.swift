//
//  cardsList.swift
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
