//
//  CardListViewModel.swift
//

import Foundation
import SwiftUI

protocol CardListViewModel: ObservableObject {
    var cardss: [Cards]? { get }
    func fetchProducts()
}
