//
//  TopicDAO.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import Foundation

struct EntryDetailDAO: Codable {
    let success: Bool
    let data: EntryDetailModel

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case data = "Data"
    }
}

// MARK: - DataClass
struct EntryDetailModel: Codable {
    let id: Int
    let title: String
    let entries: [EntryModel]
    let pageCount, pageSize, pageIndex: Int?
    let isTracked, isTrackable: Bool?
    let slug: String?
    let isAmaTopic: Bool?
    let matterCount: Int?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case title = "Title"
        case entries = "Entries"
        case pageCount = "PageCount"
        case pageSize = "PageSize"
        case pageIndex = "PageIndex"
        case isTracked = "IsTracked"
        case isTrackable = "IsTrackable"
        case slug = "Slug"
        case isAmaTopic = "IsAmaTopic"
        case matterCount = "MatterCount"
    }
}
