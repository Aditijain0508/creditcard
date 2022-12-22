//
//  LoginUseCaseImplTest.swift
//  CreditCardTests
//
//  Created by Aditi Jain 3 on 22/12/22.
//

import Foundation
import XCTest
@testable import CreditCard


class LoginUseCaseImplTest: XCTestCase {
    
    var loginUseCaseImpl: LoginUseCaseImpl!
    var loginRepository: MockLoginRepository!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginRepository = MockLoginRepository()
        loginUseCaseImpl = LoginUseCaseImpl(repository: loginRepository)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginRepository = nil
        loginRepository = nil
    }

    func testFetchProducts_Successs() throws {
        loginRepository.mockLogin = Result.success(MockUserList().user())
        loginUseCaseImpl.getLogin(email: "", password: "", completion:  { result in
            switch result {
            case .success(let user):
                XCTAssertTrue(user.count > 0)
            case .failure(_):
                XCTFail("getProducts should not fail")
            }
        })
    }
    
    func testFetchProducts_Failure() throws {
        loginUseCaseImpl.getLogin(email: "", password: "", completion:  { result in
            switch result {
            case .success(_):
                XCTFail("getProducts should be fail")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        })
    }
}

class MockLoginRepository: ILoginRepository {
    func makeServiceCallToLoginUser(email: String, password: String, completion: @escaping (Result<[AuthUser], Error>) -> Void) {
        completion(mockLogin ?? .failure(CardListViewModelError.emptyArray))
    }
    
    var mockLogin: Result<[AuthUser], Error>?
}

