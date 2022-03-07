//
//  TopicView.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import SwiftUI

struct TopicView: View {
    var topicId: String
    
    @State var topic: TopicDetail?

    var body: some View {
        ScrollView {
            ForEach(topic?.entries ?? []) { entry in
                EntryView(entry: entry)
                    .padding(.vertical, 2)
            }
        }
        .onAppear {
            performOnAppear()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
        ToolbarItem(placement: .principal) {
                Text(topic?.title ?? "")
                .font(.subheadline)
                .fixedSize()
        }
    }
    }
    
    private func performOnAppear() {
        RequestManager.getTopic(topicId: topicId) { topicModel in
            if let topicModel = topicModel {
                self.topic = topicModel
            }
        }
    }
}
