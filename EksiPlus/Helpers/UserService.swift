//
//  UserService.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import Foundation

class UserService {
    static let shared = UserService(
                                    clientSecret: "",
                                    apiSecret: "",
                                    bearer: "",
                                    uniqueID: "")
    var clientSecret: String
    var apiSecret: String
    var bearer: String
    var uniqueID: String
    var isLoggedIn = false

    init(clientSecret: String, apiSecret: String, bearer: String, uniqueID: String) {
        self.clientSecret = "eabb8841-258d-4561-89a6-66c6501dee83"
        self.apiSecret = "68f779c5-4d39-411a-bd12-cbcc50dc83dd"
        self.uniqueID = "eabb8841-258d-4561-89a6-66c6501dee83"
        self.bearer = bearer
    }
}
