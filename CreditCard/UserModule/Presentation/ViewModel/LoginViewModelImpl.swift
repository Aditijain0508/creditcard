//
//  LoginViewModelImpl.swift
//  Login
//


import Foundation

class LoginViewModelImpl: ILoginViewModel {
    @Published var isLoading: Bool = false
    
    var outputDelegate: LoginViewModelOutput?
    private let useCase: ILoginUseCase
    
    func login(email: String, password: String) {
        isLoading = true
        if checkForValidations(email: email, password: password){
        useCase.getLogin(email: email, password: password)
            .done(on: .main) { [weak self] model in
                self?.isLoading = false
                self?.outputDelegate?.success()
            }
            .catch(on: .main, policy: .allErrors) { [weak self] error in
                self?.isLoading = false
                self?.outputDelegate?.gotError(error.localizedDescription)
            }
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
