//
//  MainView.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            TopicsView()
                .tabItem {
                    Label("Gündem", systemImage: "list.dash")
                }
                .tag(1)
            
            TopicsView(topicType: .today)
                .tabItem {
                    Label("Bugün", systemImage: "list.dash")
                }
                .tag(2)
            
            Text("Hello, World!")
                .tabItem {
                    Label("Profil", systemImage: "person")
                }
                .tag(3)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .colorScheme(.dark)
    }
}
