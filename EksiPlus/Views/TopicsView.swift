//
//  ContentView.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import SwiftUI

struct TopicsView: View {
    var popularEntries: [EntryModel]
    @ObservedObject var repository = Repository.shared
    @ObservedObject var vm = TopicsViewModel()
    
    var topicType: TopicType
    
    enum TopicType {
        case popular
        case today
    }
    
    init(topicType: TopicType = .popular) {
        self.topicType = topicType
        popularEntries = DebugConstants.shared.POPULAR_ENTRIES
    }
    
    private func onScrolledAtBottom() {
        vm.performRequest()
    }
    
    func getScrollIndex(_ topicCount: Int, refreshBefore: Int = 5) -> Int {
        
        switch topicCount {
        case 0...refreshBefore:
            return topicCount
        case refreshBefore...1000:
            return topicCount - refreshBefore
        default:
            return topicCount
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(topicType == .popular ? repository.popularTopics : repository.todaysTopics) { topic in
                    NavigationLink(topic.title) {
                        TopicView(topicId: String(topic.topicID))
                    }
                    .onAppear {
                        if repository.popularTopics[getScrollIndex(repository.popularTopics.count)] == topic {
                            self.onScrolledAtBottom()
                        }
                    }
                }
            }
            .navigationTitle(topicType == .popular ? "Gündem" : "Bugün")
            .onAppear {
                vm.performRequest()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TopicsView()
    }
}
