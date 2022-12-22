//
//  LoginViewModelImpl.swift
//  Login
//


import Foundation

class LoginViewModelImpl: ILoginViewModel {
    @Published var isLoading: Bool = false
    @Published var isSuccessful: Bool = false
    
    var outputDelegate: LoginViewModelOutput?
    private let useCase: ILoginUseCase
    
    @MainActor func login(email: String, password: String) {
        isLoading = true
        if checkForValidations(email: email, password: password){
            useCase.getLogin(email: email, password: password, completion: { [weak self] result in
                switch result {
                case .success( _):
                    self?.isLoading = false
                    self?.isSuccessful = true
                    self?.outputDelegate?.success()
                case .failure(let error):
                    self?.isLoading = false
                    self?.isSuccessful = false
                    self?.outputDelegate?.gotError(error.localizedDescription)
                }
            })
        }
        else{
            isLoading = false
            self.outputDelegate?.gotError(UserModuleErrorConstants.userNamePasswordIncomplete)
        }
    }
    
    init(useCase: ILoginUseCase) {
        self.useCase = useCase
        isLoading = false
    }
    
    func checkForValidations(email: String, password: String)->Bool{
        if email.count > 0 && password.count > 0 {
            return true
        }
        else {
            return false
        }
    }
    
}
