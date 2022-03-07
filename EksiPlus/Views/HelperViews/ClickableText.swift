//
//  ClickableText.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 6.03.2022.
//

import Foundation
import SwiftUI

struct ClickableText: View {
  @Environment(\.colorScheme) var colorScheme: ColorScheme

  private var text: String
  private var onClick: (_ : String) -> Void

  @Environment(\.openURL) var openURL

  init(text: String, _ onClick: @escaping (_ : String) -> Void) {
    self.text = text
    self.onClick = onClick
  }

  var body: some View {
      Text(.init(clickable()))
      .foregroundColor(colorScheme == .dark ? .white : .black)
      .accentColor(colorScheme == .dark ? .white : .black)
      .environment(\.openURL, OpenURLAction { url in
        let trimmed = url.path
          .replacingOccurrences(of: "/", with: "")
          .trimmingCharacters(in: .letters.inverted)
        openURL(url)
        withAnimation {
          onClick(trimmed)
        }
        return .discarded
      })
  }

    private func clickable() -> String {
        var clickableText = text
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: clickableText, options: [], range: NSRange(location: 0, length: clickableText.utf16.count))

        for match in matches {
            guard let range = Range(match.range, in: clickableText) else { continue }
            let url = clickableText[range]
            // clickableText = String(clickableText.replacingOccurrences(of: url, with: "[Click here](\(url))"))
            clickableText = String(clickableText.replacingOccurrences(of: url, with: "**\(url)**"))

        }

        clickableText = String(clickableText.replacingOccurrences(of: "`", with: ""))

        let spoilerTexts = ["--- spoiler ---",
                            "--- 18+ ---"
        ]
        for spoiler in spoilerTexts {
            clickableText = String(clickableText.replacingOccurrences(of: spoiler, with: "**\(spoiler)**"))
        }

        return clickableText

    }
}
