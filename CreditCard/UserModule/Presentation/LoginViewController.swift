//
//  LoginViewController.swift
//  Login
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {

    var viewModel: LoginViewModelImpl?
    var networkManager: INetworkManager = {
        let networkManager = NetworkManager()
        return networkManager
    }()

    override func loadView() {
        let loginViewController = UIHostingController(rootView: LoginView(viewModel: viewModel!))
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
        DispatchQueue.main.async {
            let swiftUIViewController = CardList(networkManager: self.networkManager).createCardListViewController()
            self.navigationController?.pushViewController(swiftUIViewController, animated: true)
        }
    }
    
    func gotError(_ error: String) {
        showAlert(message: error, on: self)
    }
    
}
