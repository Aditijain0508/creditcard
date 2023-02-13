//
//  CreditCardUITests.swift
//

import XCTest

class CreditCardUITests: XCTestCase {

    override func setUpWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let usernameField = app.textFields["Enter Email"]
        XCTAssertTrue(usernameField.exists)
        
        usernameField.tap()
        usernameField.typeText("email")
        
        let passwordField = app.secureTextFields["Enter Password"]
        XCTAssertTrue(passwordField.exists)
        
        passwordField.tap()
        passwordField.typeText("password")
        
        let button = app.buttons["LOGIN"]
        XCTAssertTrue(button.exists)
        
        button.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
