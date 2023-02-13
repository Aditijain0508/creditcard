//
//  AppDIContainer.swift
//

import Foundation
import UIKit

class AppContainer {
    func startApp(on window: UIWindow?) {
        if let controller = CreditCardRouter.routeToLoginModule() {
            window?.rootViewController = controller
        }
        window?.makeKeyAndVisible()
    }
}
