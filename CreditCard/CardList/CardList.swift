//
//  CardList.swift
//  Card
//
//  Created by Aditi jain on 12/12/22.
//
import Foundation
import UIKit
import Network
import SwiftUI

public class CardList {
        
    public init() {}
    
    public func createCardListViewController() -> UIViewController {
        let viewModel = createCardListViewModel()
        let swiftUiViewController = UIHostingController(rootView: CardListView(listViewModel: viewModel))
        return swiftUiViewController
    }
    
    private func createCardListViewModel() -> CardListViewModelImpl {
        let viewModel = CardListViewModelImpl(useCase: createCardListUseCase())
        return viewModel
    }
    
    private func createCardListUseCase() -> CardListUseCase {
        let useCase = CardListUseCaseImpl(repository: createCardListRepository())
        return useCase
    }
    
    private func createCardListRepository() -> CardListRepository {
        let repository = CardListRepositoryImpl(service: createCardListService())
        return repository
    }
    
    private func createCardListService() -> CardListService {
        let service = CardListServiceImpl()
        return service
    }
    
}

