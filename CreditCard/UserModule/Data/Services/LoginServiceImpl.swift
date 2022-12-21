//
//  LoginServiceImpl.swift
//  Login
//

import Foundation
import PromiseKit

class LoginServiceImpl: ILoginService {
    
    let dataHelper:DataHelper
    
    init(dataHelper: DataHelper){
        self.dataHelper = dataHelper
    }
    
    func makeNetworkRequest(email: String, password: String) -> UserResponse {
        
        return Promise<Bool> { seal in
            let contactRequestModel = APIRequestModel(api: LoginAPI.login)
            dataHelper.requestAPI(apiModel: contactRequestModel) { response in
                switch response {
                case .success(_):
                    seal.fulfill(true)
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
}

enum LoginAPI {
    case login
}

extension LoginAPI: APIProtocol {
    func httpMthodType() -> HTTPMethodType {
        return .get
    }
    
    func apiEndPath() -> String {
        return APIEndPointConstants.loginEndoint
    }
    
    func apiBasePath() -> String {
        return WebserviceConstants.loginBaseURL
    }
}
