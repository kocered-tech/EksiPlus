//
//  EntryView.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import SwiftUI
import Kingfisher

struct EntryView: View {
    @State var entry: EntryModel

    init(entry: EntryModel) {
        self.entry = entry
    }

    var body: some View {
        VStack {
            HStack {
                ClickableText(text: entry.content) { _ in
                }
                .multilineTextAlignment(.leading)
                .padding()
            Spacer()
            }

            HStack {
            VStack {
                HStack {
                    Spacer()

                    Text(convertDateFormatter(date: entry.created))
                }

                HStack {
                    Spacer()

                    Text(entry.author.nick)
                        .foregroundColor(.green)
                }
            }
                if let url = URL(string: entry.avatarURL ?? "") {
                    KFImage(url)
                    .resizable()
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .overlay(Circle().stroke(Color.green, lineWidth: 2))
                    .frame(width: 50, height: 50, alignment: .center)
                }
            }
            .padding(.horizontal)

            HStack {
                Spacer()

                Image(systemName: (entry.isFavorite ?? false) ? "heart.fill" : "heart")
                    .foregroundColor(.red)
                    .onTapGesture {
                        withAnimation {
                            entry.toggle()
                        }
                        RequestManager.favorite(id: String(entry.id))
                    }

                Text(String(entry.favoriteCount ?? 0))
            }
            .padding(.horizontal)

        }
        .background(Color(uiColor: UIColor.systemGray6))
        .cornerRadius(5)
    }

    public func convertDateFormatter(date: String) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"// this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "GMT+3")! as TimeZone
        dateFormatter.locale = Locale(identifier: "tr_TR")
        let convertedDate = dateFormatter.date(from: date)

        guard dateFormatter.date(from: date) != nil else {
            assert(false, "no date from string")
            return ""
        }
        dateFormatter.dateFormat = "MMM d, yyyy"
        dateFormatter.locale = Locale(identifier: "tr_TR")
        dateFormatter.timeZone = NSTimeZone(name: "GMT+3")! as TimeZone
        let timeStamp = dateFormatter.string(from: convertedDate!)

        return timeStamp
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(entry: DebugConstants.shared.ENTRY_1)
            .colorScheme(.dark)
    }
}
