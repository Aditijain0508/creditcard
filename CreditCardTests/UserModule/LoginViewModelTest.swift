//
//  LoginViewModelTest.swift
//

import XCTest
@testable import CreditCard

class LoginViewModelTest: XCTestCase {

    var loginViewModel: LoginViewModelImpl?
    var useCase = MockLoginUseCase()

    override func setUp() {
        super.setUp()
        loginViewModel = LoginViewModelImpl(useCase: useCase)
    }

    override func tearDown() {
        super.tearDown()
    }

    @MainActor func testViewModel_Success() {
        let expectation = expectation(description: "Success Response")
        useCase.mockLogin = Result.success(MockUserList().user())
        loginViewModel?.login(email: "abh", password: "abh")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertTrue(loginViewModel?.isSuccessful == true)
    }
    
    @MainActor func testViewModel_Failure() {
        let expectation = expectation(description: "Invalid Response")
        loginViewModel?.login(email: "abh", password: "abh")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertTrue(loginViewModel?.isSuccessful == false)
    }

    @MainActor func testViewModel_Fail() {
        loginViewModel?.login(email: "", password: "")
        XCTAssertTrue(loginViewModel?.isSuccessful == false)
    }

    func testValidation() {
        let result = loginViewModel?.checkForValidations(email: "akj", password: "password") ?? false
        XCTAssertTrue(result)
        let resultFalse = loginViewModel?.checkForValidations(email: "", password: "") ?? true
        XCTAssertFalse(resultFalse)
    }
}

class MockLoginUseCase: ILoginUseCase {
    func getLogin(email: String, password: String, completion: @escaping (Result<[AuthUser], Error>) -> Void) {
        completion(mockLogin ?? .failure(LoginViewModelError.emptyArray))
    }
    
    var mockLogin: Result<[AuthUser], Error>?
}
