//
//  RepositoriesViewModel.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 6.03.2022.
//

import Foundation
import Combine
import SwiftUI

class TopicsViewModel: ObservableObject {
    @Published var currentPage = 1
    @Published var canLoadNextPage = true

    func performRequest() {
        RequestManager.getPopularTopics(page: currentPage) { data in
            if let data = data {
                Repository.shared.popularTopics.append(contentsOf: data.topics)
                self.currentPage += 1
            }
        }
    }
}
