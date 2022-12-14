//
//  CardListViewModel.swift
//  Card
//
//  Created by Aditi jain on 12/12/22.
//
import Foundation
import SwiftUI

protocol CardListViewModel: ObservableObject {
    var cardss: [Cards] { get }
    var outputDelegate: CardListViewModelOutput? { get set }
    func fetchProducts()
}
