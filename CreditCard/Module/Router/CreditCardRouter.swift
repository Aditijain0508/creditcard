//
//  CreditCardRouter.swift
//

import Foundation
import UIKit

class CreditCardRouter: NSObject {
    
    static let networkManager = NetworkManager.initObject
    
    static func routeToLoginModule() -> UIViewController? {
        let module = LoginModule(networkManager: networkManager)
        if let controller = module.createLoginViewController() {
            let nvc: UINavigationController = UINavigationController(rootViewController: controller)
            return nvc
        }
        return nil
    }
    
    static func routeToCardModule() -> UIViewController {
        let swiftUIViewController = CardList(networkManager: self.networkManager).createCardListViewController()
        return swiftUIViewController
    }

}
