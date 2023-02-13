//
//  MockURLSession.swift
//

import Foundation

class MockURLSession: URLSession {
    
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?
    
    override func dataTask(with request: URLRequest,
                           completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
        
        return MockURLSessionDataTask.init {
            completionHandler(self.data, self.urlResponse, self.error)
        }
    }
}
