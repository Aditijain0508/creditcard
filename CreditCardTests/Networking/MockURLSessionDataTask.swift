//
//  MockURLSessionDataTask.swift
//  TestDemoTests
//
//  Created by   on 19/08/22.
//

import Foundation

class MockURLSessionDataTask: URLSessionDataTask {

    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
