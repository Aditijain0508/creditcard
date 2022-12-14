//
//  LoginModule.swift
//  Login
//


import Foundation
import UIKit


public class UserModule {
    public init() {
    }
    
    public func createLoginViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let nxtVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")

        let viewController = nxtVC as! LoginViewController
        viewController.viewModel = createLoginViewModel()
        viewController.viewModel?.outputDelegate = viewController
        return viewController
    }
    
    private func createLoginViewModel() -> ILoginViewModel {
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
        let service = LoginServiceImpl()
        return service
    }

}
