//
//  EntryModel.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import Foundation

struct EntryModel: Codable, Identifiable {
    let id: Int
    let content: String
    let author: Author
    let created: String
    let lastUpdated: String?
    var isFavorite: Bool?
    let favoriteCount: Int?
    let hidden, active: Bool?
    let commentCount: Int?
    let avatarURL: String?
    let isSponsored, isPinned, isPinnedOnProfile, isVerifiedAccount: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case content = "Content"
        case author = "Author"
        case created = "Created"
        case lastUpdated = "LastUpdated"
        case isFavorite = "IsFavorite"
        case favoriteCount = "FavoriteCount"
        case hidden = "Hidden"
        case active = "Active"
        case commentCount = "CommentCount"
        case avatarURL = "AvatarUrl"
        case isSponsored = "IsSponsored"
        case isPinned = "IsPinned"
        case isPinnedOnProfile = "IsPinnedOnProfile"
        case isVerifiedAccount = "IsVerifiedAccount"
    }

    mutating func toggle() {
        self.isFavorite?.toggle()
    }
}

// MARK: - Author
struct Author: Codable {
    let nick: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case nick = "Nick"
        case id = "Id"
    }
}
