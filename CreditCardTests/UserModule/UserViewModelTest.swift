//
//  UserViewModelTest.swift
//  Login
//


import XCTest
@testable import CreditCard

class UserViewModelTest: XCTestCase {
    
    var userViewModel: LoginViewModelImpl?
    var useCase = MockUseCase()
    private var promise: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        userViewModel = LoginViewModelImpl(useCase: useCase)
        userViewModel?.outputDelegate = self
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewModel_Success() {
        promise = expectation(description: "Should get success")
        userViewModel?.login(email: Constant.email, password: Constant.password)
        wait(for: [promise], timeout: 10.0)
    }
    
    func testViewModel_Fail() {
        promise = expectation(description: "Should get fail")
        useCase.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed Error"])
        userViewModel?.login(email: Constant.email, password: Constant.password)
        wait(for: [promise], timeout: 10.0)
    }
    
    func testValidation() {
        let result = userViewModel?.checkForValidations(email: Constant.email, password: Constant.password) ?? false
        XCTAssertTrue(result)
        let resultFalse = userViewModel?.checkForValidations(email: Constant.email, password: "") ?? true
        XCTAssertFalse(resultFalse)
    }
    
    
}

extension UserViewModelTest: LoginViewModelOutput {
    
    func success() {
        promise.fulfill()
    }
    
    func gotError(_ error: String) {
        XCTAssertTrue(error == "Failed Error")
        promise.fulfill()
        //XCTFail()
    }
    
}


struct Constant {
    static let email = "sk@gmail.com"
    static let password = "123456"
}
