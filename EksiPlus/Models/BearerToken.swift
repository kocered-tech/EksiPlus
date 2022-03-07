//
//  BearerToken.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import Foundation

// MARK: - BearerToken
struct BearerToken: Codable {
    let accessToken, tokenType: String
    let expiresIn: Int
    let refreshToken, rank, nick, userID: String
    let loginType: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case rank, nick
        case userID = "user_id"
        case loginType = "login_type"
    }
}
