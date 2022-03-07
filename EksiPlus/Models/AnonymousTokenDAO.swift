//
//  AnonymousTokenDAO.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import Foundation

struct AnonymousTokenDAO: Codable {
    let success: Bool
    let data: AnonymousTokenData

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case data = "Data"
    }
}

// MARK: - DataClass
struct AnonymousTokenData: Codable {
    let rank, accessToken, tokenType, expiresIn: String
    let issued, expires: String

    enum CodingKeys: String, CodingKey {
        case rank
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case issued = ".issued"
        case expires = ".expires"
    }
}
