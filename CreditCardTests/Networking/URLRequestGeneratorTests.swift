//
//  URLRequestGeneratorTests.swift
//

import XCTest

@testable import CreditCard

class URLRequestGeneratorTests: XCTestCase {
    
    var requestGenerator: IURLRequestGenerator!
    
    override func setUp() {
        super.setUp()
        requestGenerator = URLRequestGenerator()
    }
    
    override func tearDown() {
        requestGenerator = nil
        super.tearDown()
    }

    func testURLRequest() {
        let request = NetworkRequest(path: "/posts",
                                     method: .get, baseUrl: "https://jsonplaceholder.typicode.com/",
                                     headerParamaters: ["Content-Type": "application/json"])
        do {
            let urlRequest = try requestGenerator.createURLRequest(using: request)
            XCTAssertEqual(urlRequest.url?.host, "jsonplaceholder.typicode.com")
            XCTAssertEqual(urlRequest.url?.scheme, "https")
            XCTAssertEqual(urlRequest.url?.path, "//posts")
            XCTAssertEqual(urlRequest.url, URL(string: "https://jsonplaceholder.typicode.com//posts"))
            XCTAssertEqual(urlRequest.httpMethod, HTTPMethod.get.rawValue)
            XCTAssertEqual(urlRequest.allHTTPHeaderFields, ["Content-Type": "application/json"])
            XCTAssertNil(urlRequest.httpBody)
        } catch {
            XCTFail("Request Failure not expected")
        }
    }
    
    func testURLRequestNil() {
        let expectation = expectation(description: "Bad url")

        let request = NetworkRequest(path: "/podw/%",
                                     method: .get, baseUrl: "/",
                                     headerParamaters: ["Content-Type": "application/json"])
        do {
            _ = try requestGenerator.createURLRequest(using: request)
            XCTFail("Success not expectd")
        } catch {
            if let iError = error as? NetworkError {
                XCTAssertEqual(iError, NetworkError.noData)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)

    }
    
    func testURLRequestWithBodyParameter() {
        let request = NetworkRequest(path: "/posts",
                                     method: .get, baseUrl: "https://jsonplaceholder.typicode.com/",
                                     headerParamaters: ["Content-Type": "application/json"], bodyParamaters: ["test": "test"])
        do {
            let urlRequest = try requestGenerator.createURLRequest(using: request)
            XCTAssertNotNil(urlRequest.httpBody)
        } catch {
            XCTFail("Request Failure not expected")
        }
    }
}
