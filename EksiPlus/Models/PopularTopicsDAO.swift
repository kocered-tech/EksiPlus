//
//  PopularTopicsDAO.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import Foundation

struct PopularTopicsDAO: Codable {
    let success: Bool?
    let data: PopularTopicsData

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case data = "Data"
    }
}

// MARK: - DataClass
struct PopularTopicsData: Codable {
    var topics: [Topic]
    let pageCount, pageSize, pageIndex: Int
    let hasPinnedIndexItem: Bool

    enum CodingKeys: String, CodingKey {
        case topics = "Topics"
        case pageCount = "PageCount"
        case pageSize = "PageSize"
        case pageIndex = "PageIndex"
        case hasPinnedIndexItem = "HasPinnedIndexItem"
    }
}

// MARK: - Topic
struct Topic: Codable, Identifiable, Hashable {
    let id = UUID()
    let matchedCount, topicID, fullCount: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case matchedCount = "MatchedCount"
        case topicID = "TopicId"
        case fullCount = "FullCount"
        case title = "Title"
    }
}
