//
//  BaseUIViewController.swift
//  Core
//

import Foundation
import UIKit

public protocol Alertable {
    func showAlert(title: String?, message: String?, on controller: UIViewController)
}

extension Alertable {
    public func showAlert(title: String? = nil, message: String?, on controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        controller.present(alert, animated: true)
            //TEst code added
        
    }
}
