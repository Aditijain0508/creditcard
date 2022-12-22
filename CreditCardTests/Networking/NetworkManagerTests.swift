//
//  NetworkManagerTests.swift
//  TestDemoTests
//
//  Created by   on 22/08/22.
//

import XCTest
@testable import CreditCard

class NetworkManagerTests: XCTestCase {
    
    var networkManger: INetworkManager!
    var mockURLSession: MockURLSession!
    
    var response: HTTPURLResponse {
        return HTTPURLResponse(url: URL(string: "/posts")!,
                               statusCode: 200,
                               httpVersion: nil,
                               headerFields: nil)!
    }
    
    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
        networkManger = NetworkManager(session: mockURLSession)
    }

    override func tearDown() {
        networkManger = nil
        mockURLSession = nil
        super.tearDown()
    }
    
    func testRequestSuccessResponse() {
        let expectation = expectation(description: "Success Response")
        mockURLSession.data = MockData.userData
        mockURLSession.urlResponse = response
        
        let request = NetworkRequest(path: "posts", method: .get, baseUrl: "https://jsonplaceholder.typicode.com/")
        networkManger.request(request: request) { (result: Result<[AuthUser], Error>) in
            switch result {
            case let .success(posts):
                XCTAssertTrue(posts.count == 4)
                expectation.fulfill()
            case .failure(_):
                XCTFail("Failure not expected")
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testRequestFailureCase() {
        let expectation = expectation(description: "Bad Request Failure Case")
        mockURLSession.error = NSError(domain: "Failed", code: 0)
        
        let request = NetworkRequest(path: "posts", method: .get, baseUrl: "https://jsonplaceholder.typicode.com/")
        networkManger.request(request: request) { (result: Result<[AuthUser], Error>) in
            switch result  {
            case .success(_):
                XCTFail("Success not expectd")
            case let .failure(error):
                XCTAssertEqual(error as! NetworkError, NetworkError.badRequest)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testInvalidRequestFailure() {
        let expectation = expectation(description: "Invalid Request")
        let request = NetworkRequest(path: "(#$%", method: .get, baseUrl: "https://jsonplaceholder.typicode.com/")

        networkManger.request(request: request) { (result: Result<[AuthUser], Error>) in
            switch result {
            case .success(_):
                XCTFail("Success not expected")
            case let .failure(error):
                XCTAssertEqual(error as! NetworkError, NetworkError.invalidRequest)
                XCTAssertEqual((error as! NetworkError).description, "Invalid Request")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testNoResponseFailureCase() {
        let expectation = expectation(description: "No Response Failure Case")
        mockURLSession.data = MockData.userData
        
        let request = NetworkRequest(path: "posts", method: .get, baseUrl: "https://jsonplaceholder.typicode.com/")
        networkManger.request(request: request) { (result: Result<[AuthUser], Error>) in
            switch result  {
            case .success(_):
                XCTFail("Success not expectd")
            case let .failure(error):
                XCTAssertEqual(error as! NetworkError, NetworkError.noResponse)
                XCTAssertEqual((error as! NetworkError).description, "Response returned with no response")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
}
class MockData {
    
    static var user: [AuthUser] {
        try! JSONDecoder().decode([AuthUser].self, from: userData)
    }
    
    static var userData: Data {
        loadJsonData("User")
    }
    
    static func loadJsonData(_ fromFile: String) -> Data {
        let path = Bundle(for: self).path(forResource: fromFile, ofType: "json")
        let jsonString = try! String(contentsOfFile: path!, encoding: .utf8)
        let data = jsonString.data(using: .utf8)!
        return data
    }
}
