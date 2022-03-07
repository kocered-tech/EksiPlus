//
//  DebugConstants.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

// swiftlint:disable line_length
// swiftlint:disable identifier_name

import Foundation

class DebugConstants {

    static let shared = DebugConstants()

    var AUTHOR_1 = Author(nick: "erdem", id: 5)

    var ENTRY_1: EntryModel { EntryModel(id: 1, content: "vay amk dedirten anketti. egemen bir devlet işgal ediliyor, insanlar soykırımdan geçiriliyor, korkutuluyor ve bunu haklı gören insanlar var. dilerim ukraynalıların yaşadıklarını anneniz, babanız, kız kardeşleriniz (özellikle kız kardeşleriniz diyorum) tez zamanda fazlasıyla yaşar da biz de onları (özellikle kız kardeşlerinizi) haksız görürürüz. ekleme : moskofçulardan bir sürü mesaj geldi. sanırım batı medyasının propagandalarına karınları tokmuş. bunu diyenlerin profillerini şöyle bir incelediğimde ise çoğunun abd ve avrupa ülkelerinde yaşadıklarını görüyorum. ilginç.", author: AUTHOR_1, created: "4312", lastUpdated: "34241", isFavorite: true, favoriteCount: 5, hidden: false, active: true, commentCount: 4, avatarURL: "avatarurl", isSponsored: true, isPinned: false, isPinnedOnProfile: false, isVerifiedAccount: false) }

    var ENTRY_2: EntryModel { EntryModel(id: 1, content: "türkiye'de bisikletin hala yaygınlaşmaması", author: AUTHOR_1, created: "4312", lastUpdated: "34241", isFavorite: true, favoriteCount: 5, hidden: false, active: true, commentCount: 4, avatarURL: "avatarurl", isSponsored: true, isPinned: false, isPinnedOnProfile: false, isVerifiedAccount: false) }

    var ENTRY_3: EntryModel { EntryModel(id: 2, content: "Elden Ring", author: AUTHOR_1, created: "4312", lastUpdated: "34241", isFavorite: true, favoriteCount: 5, hidden: false, active: true, commentCount: 4, avatarURL: "avatarurl", isSponsored: true, isPinned: false, isPinnedOnProfile: false, isVerifiedAccount: false) }

    var ENTRY_4: EntryModel { EntryModel(id: 3, content: "Edebiyat tarihinin en ilginç cümlesi", author: AUTHOR_1, created: "4312", lastUpdated: "34241", isFavorite: true, favoriteCount: 5, hidden: false, active: true, commentCount: 4, avatarURL: "avatarurl", isSponsored: true, isPinned: false, isPinnedOnProfile: false, isVerifiedAccount: false) }

    var ENTRY_5: EntryModel { EntryModel(id: 4, content: "Pera Palasta Gece yarısı", author: AUTHOR_1, created: "4312", lastUpdated: "34241", isFavorite: true, favoriteCount: 5, hidden: false, active: true, commentCount: 4, avatarURL: "avatarurl", isSponsored: true, isPinned: false, isPinnedOnProfile: false, isVerifiedAccount: false) }

    var ENTRY_6: EntryModel { EntryModel(id: 5, content: "sophie turner", author: AUTHOR_1, created: "4312", lastUpdated: "34241", isFavorite: true, favoriteCount: 5, hidden: false, active: true, commentCount: 4, avatarURL: "avatarurl", isSponsored: true, isPinned: false, isPinnedOnProfile: false, isVerifiedAccount: false) }

    var POPULAR_ENTRIES: [EntryModel] { [ENTRY_1,
                                         ENTRY_2,
                                         ENTRY_3,
                                         ENTRY_4,
                                         ENTRY_5,
                                         ENTRY_6] }

// var TOPIC_1: TopicModelDAO { TopicModelDAO(id: 5,
//                         title: "sophie turner",
//                         entries: POPULAR_ENTRIES,
//                         pageCount: 5,
//                         pageSize: 5,
//                         pageIndex: 1,
//                         isTracked: false,
//                         isTrackable: false,
//                         slug: "",
//                         isAmaTopic: false,
//                         matterCount: 5)
//    }
}
// swiftlint:enable line_length
// swiftlint:enable identifier_name
