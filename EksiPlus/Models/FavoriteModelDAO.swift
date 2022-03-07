//
//  FavoriteModelDAO.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import Foundation

struct FavoriteModelDAO: Codable {
    let success: Bool
    let data: DataClass

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case data = "Data"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let success: Bool
    let count: Int

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case count = "Count"
    }
}
