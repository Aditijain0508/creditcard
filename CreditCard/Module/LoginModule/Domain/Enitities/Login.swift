//
//  AuthUser.swift
//

import Foundation

struct AuthUser: Decodable {
    let userId: Int
    let postId: Int
    let title: String
    let body: String

    private enum CodingKeys: String, CodingKey {
        case userId
        case postId = "id"
        case title
        case body
    }
}
