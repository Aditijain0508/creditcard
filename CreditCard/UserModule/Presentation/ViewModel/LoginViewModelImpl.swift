//
//  LoginViewModelImpl.swift
//  Login
//


import Foundation

class LoginViewModelImpl: ILoginViewModel {
    
    @Published var success = false
    var outputDelegate: LoginViewModelOutput?
    
    private let useCase: ILoginUseCase
    
    func login(email: String, password: String) {
        if checkForValidations(email: email, password: password){
        useCase.getLogin(email: email, password: password)
            .done(on: .main) { [weak self] model in
                debugPrint("Success ===> ", model)
                self?.success = true
                self?.outputDelegate?.success()
            }
            .catch(on: .main, policy: .allErrors) { [weak self] error in
                self?.outputDelegate?.gotError(error.localizedDescription)
            }
        }
        else{
            self.outputDelegate?.gotError(UserModuleErrorConstants.userNamePasswordIncomplete)
        }
    }
    
    init(useCase: ILoginUseCase) {
        self.useCase = useCase
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
