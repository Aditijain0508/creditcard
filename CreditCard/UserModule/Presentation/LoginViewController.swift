//
//  LoginViewController.swift
//  Login
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    var viewModel: ILoginViewModel?

    override func loadView() {
        let loginViewController = UIHostingController(rootView: LoginView(viewModel: viewModel))
        view = UIView()
        self.addChild(loginViewController)
        view.addSubview(loginViewController.view)
        loginViewController.view.frame = view.bounds
        loginViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loginViewController.didMove(toParent: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


extension LoginViewController: Alertable, LoginViewModelOutput {
    
    func success() {
        let swiftUIViewController = CardList().createCardListViewController()
        self.navigationController?.pushViewController(swiftUIViewController, animated: true)
        
    }
    
    func gotError(_ error: String) {
        showAlert(message: error, on: self)
    }
    
}
