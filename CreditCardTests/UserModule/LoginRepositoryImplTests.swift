//
//  LoginRepositoryImplTests.swift
//

import Foundation
import XCTest
@testable import CreditCard

class LoginRepositoryImplTests: XCTestCase {
    
    var loginService: MockLoginService!
    var loginRepositoryImpl: LoginRepositoryImpl!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginService = MockLoginService()
        loginRepositoryImpl = LoginRepositoryImpl(service: loginService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginService = nil
        loginRepositoryImpl = nil
    }

    func testFetchProducts_Successs() throws {
        loginService.mockLogin = Result.success(MockUserList().user())
        loginRepositoryImpl.makeServiceCallToLoginUser(email: "", password: "", completion: { result in
            switch result {
            case .success(let user):
                XCTAssertTrue(user.count > 0)
            case .failure:
                XCTFail("makeServiceCallToGetProducts should not fail")
            }
        })
    }
    
    func testFetchProducts_Failure() throws {
        loginRepositoryImpl.makeServiceCallToLoginUser(email: "", password: "", completion: { result in
            switch result {
            case .success:
                XCTFail("makeServiceCallToGetProducts should be fail")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        })
    }
}

class MockLoginService: ILoginService {
    func makeNetworkRequest(email: String, password: String, completion: @escaping (Result<[AuthUser], Error>) -> Void) {
        completion(mockLogin ?? .failure(LoginViewModelError.emptyArray))
    }
    
    var mockLogin: Result<[AuthUser], Error>?
}

enum LoginViewModelError: Error {
    case emptyArray
}

class MockUserList {
    func user() -> [AuthUser] {
        let user = AuthUser(userId: 1, postId: 1, title: "user 1", body: "body")
       return [user]
    }
}
