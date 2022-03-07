//
//  EksiPlusApp.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import SwiftUI

@main
struct EksiPlusApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
            
        }
    }
} 
extension UINavigationController {

  open override func viewWillLayoutSubviews() {
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }

}
