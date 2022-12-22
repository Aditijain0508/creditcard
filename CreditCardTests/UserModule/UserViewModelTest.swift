//
//  UserViewModelTest.swift
//  Login
//


import XCTest
@testable import CreditCard



class UserViewModelTest: XCTestCase {

    var userViewModel: LoginViewModelImpl?
    var useCase = MockLoginUseCase()

    override func setUp() {
        super.setUp()
        userViewModel = LoginViewModelImpl(useCase: useCase)
    }

    override func tearDown() {
        super.tearDown()
    }

    @MainActor func testViewModel_Success() {
        useCase.mockLogin = Result.success(MockUserList().user())
        userViewModel?.login(email: "abh", password: "abh")
        XCTAssertTrue(userViewModel?.isSuccessful == true)
    }

    @MainActor func testViewModel_Fail() {
        userViewModel?.login(email: "", password: "")
        XCTAssertTrue(userViewModel?.isSuccessful == false)
    }

    func testValidation() {
        let result = userViewModel?.checkForValidations(email: "akj", password: "password") ?? false
        XCTAssertTrue(result)
        let resultFalse = userViewModel?.checkForValidations(email: "", password: "") ?? true
        XCTAssertFalse(resultFalse)
    }


}


class MockLoginUseCase: ILoginUseCase {
    func getLogin(email: String, password: String, completion: @escaping (Result<[AuthUser], Error>) -> Void) {
        completion(mockLogin ?? .failure(LoginViewModelError.emptyArray))
    }
    
    var mockLogin: Result<[AuthUser], Error>?
}
