//
//  LoginViewController.swift
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {

    var viewModel: LoginViewModelImpl?

    override func loadView() {
        guard let vModel = viewModel else { return }
        let loginViewController = UIHostingController(rootView: LoginView(viewModel: vModel))
        view = UIView()
        self.addChild(loginViewController)
        view.addSubview(loginViewController.view)
        loginViewController.view.backgroundColor = UIColor.white
        loginViewController.view.frame = view.bounds
        loginViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loginViewController.didMove(toParent: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension LoginViewController: LoginViewModelOutput {
    
    func success() {
        self.navigationController?.pushViewController(CreditCardRouter.routeToCardModule(), animated: true)
    }
    
    func gotError(_ error: String) {
        showAlert(message: error, on: self)
    }
    
    public func showAlert(title: String? = nil, message: String?, on controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        controller.present(alert, animated: true)
    }
    
}
