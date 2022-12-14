//
//  AppDIContainer.swift
//  Login
//


import Foundation
import UIKit

class AppContainer {
    // Starting app here only we could separate out the Files if we need
    
    func startApp(on window: UIWindow?) {
        let module = UserModule()
        let controller = module.createLoginViewController()
        let nvc: UINavigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
    }
}
