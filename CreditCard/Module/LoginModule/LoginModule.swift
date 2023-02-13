//
//  LoginModule.swift
//

import Foundation
import UIKit

public class LoginModule {
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    
    public func createLoginViewController() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let nxtVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
     
        if let viewController = nxtVC as? LoginViewController {
            viewController.viewModel = createLoginViewModel()
            viewController.viewModel?.outputDelegate = viewController
            return viewController
        }
        return nil
    }
    
    private func createLoginViewModel() -> LoginViewModelImpl {
        let viewModel = LoginViewModelImpl(useCase: createLoginUseCase())
        return viewModel
    }

    private func createLoginUseCase() -> ILoginUseCase {
        let useCase = LoginUseCaseImpl(repository: createLoginRepository())
        return useCase
    }

    private func createLoginRepository() -> ILoginRepository {
        let repository = LoginRepositoryImpl(service: createLoginService())
        return repository
    }

    private func createLoginService() -> ILoginService {
        let service = LoginServiceImpl(networkManager: self.networkManager)
        return service
    }

}
