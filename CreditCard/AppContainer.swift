//
//  AppDIContainer.swift
//  Login
//


import Foundation
import UIKit

class AppContainer {

    var networkManager: INetworkManager = {
        let networkManager = NetworkManager()
        return networkManager
    }()
    
    func startApp(on window: UIWindow?) {
        let module = UserModule(networkManager: networkManager)
        let controller = module.createLoginViewController()
        let nvc: UINavigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
    }
}
