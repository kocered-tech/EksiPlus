//
//  Repository.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import Foundation
import SwiftUI
import Combine

class Repository: ObservableObject {
    static let shared = Repository(popularTopics: [],
                                   todaysTopics: [])

    @Published var popularTopics: [Topic]
    @Published var todaysTopics: [Topic]

    @Published var popularTopicsData: PopularTopicsData?

    init(popularTopics: [Topic], todaysTopics: [Topic]) {
        self.popularTopics = popularTopics
        self.todaysTopics = todaysTopics
    }
}
