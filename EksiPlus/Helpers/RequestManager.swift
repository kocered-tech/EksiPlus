//
//  RequestManager.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import Foundation
import Alamofire

class RequestManager {
    
    static func getAnonymousToken(completion: @escaping (String?) -> Void) {
        let headers: HTTPHeaders = [
            "Host": "api.eksisozluk.com",
            "Content-Type": "application/x-www-form-urlencoded",
            "Content-Length": "184",
            "Accept-Encoding": "gzip, deflate",
            "User-Agent": "okhttp/3.12.1",
            "Connection": "close",
        ]
        
        let parameters: [String: String] = [
            "Api-Secret": "68f779c5-4d39-411a-bd12-cbcc50dc83dd",
            "Client-Secret": "eabb8841-258d-4561-89a6-66c6501dee83",
            "ClientUniqueId": "1a62383d-742e-4bcf-bf77-2fe1a1edcd39"
        ]
        
        AF.request("https://api.eksisozluk.com/v2/account/anonymoustoken", method: .post, parameters: parameters, headers: headers)
            .responseDecodable(of: AnonymousTokenDAO.self) { response in
                if let dao = response.value {
                    completion(dao.data.accessToken)
                } else {
                    completion(nil)
                }
            }
    }
    
    static func getEntry(entryId: String, completion: @escaping ([EntryModel]?) -> Void) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + UserService.shared.bearer,
            "Host": "api.eksisozluk.com",
            "Accept-Encoding": "gzip, deflate",
            "User-Agent": "okhttp/3.12.1",
            "Api-Secret": "68f779c5-4d39-411a-bd12-cbcc50dc83dd",
            "Client-Secret": "eabb8841-258d-4561-89a6-66c6501dee83",
            "Connection": "close"
        ]
        
        AF.request("https://api.eksisozluk.com/v2/entry/\(entryId)", method: .get, headers: headers)
            .responseDecodable(of: EntryDetailDAO.self) { response in
                if let response = response.value {
                    completion(response.data.entries)
                } else {
                    completion(nil)
                }
            }
    }
    
    static func getTopic(topicId: String, completion: @escaping (TopicDetail?) -> Void) {
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + UserService.shared.bearer,
            "Host": "api.eksisozluk.com",
            "Accept-Encoding": "gzip, deflate",
            "User-Agent": "okhttp/3.12.1",
            "Api-Secret": "68f779c5-4d39-411a-bd12-cbcc50dc83dd",
            "Client-Secret": "eabb8841-258d-4561-89a6-66c6501dee83",
            "Connection": "close"
        ]
        
        AF.request("https://api.eksisozluk.com/v2/topic/\(topicId)", method: .get, headers: headers)
            .responseDecodable(of: TopicModelDAO.self) { response in
                if let response = response.value {
                    completion(response.data)
                } else {
                    completion(nil)
                }
            }
    }
    
    static func getPopularTopics(page: Int = 1, completion: @escaping (PopularTopicsData?) -> Void) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + UserService.shared.bearer,
            "Host": "api.eksisozluk.com",
            "Accept-Encoding": "gzip, deflate",
            "User-Agent": "okhttp/3.12.1",
            "Api-Secret": "68f779c5-4d39-411a-bd12-cbcc50dc83dd",
            "Client-Secret": "eabb8841-258d-4561-89a6-66c6501dee83",
            "Connection": "close"
        ]
        
        AF.request("https://api.eksisozluk.com/v2/index/popular/?p=\(page)", method: .post, headers: headers)
            .responseDecodable(of: PopularTopicsDAO.self) { response in
                if let response = response.value {
                    completion(response.data)
                } else {
                    completion(nil)
                }
            }
    }
    
    static func getTodaysTopics(page: Int = 1) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + UserService.shared.bearer,
            "Host": "api.eksisozluk.com",
            "Accept-Encoding": "gzip, deflate",
            "User-Agent": "okhttp/3.12.1",
            "Api-Secret": "68f779c5-4d39-411a-bd12-cbcc50dc83dd",
            "Client-Secret": "eabb8841-258d-4561-89a6-66c6501dee83",
            "Connection": "close"
        ]
        
        AF.request("https://api.eksisozluk.com/v2/index/today/?p=\(page)", method: .get, headers: headers)
            .responseDecodable(of: PopularTopicsDAO.self) { response in
                if let response = response.value {
                    Repository.shared.todaysTopics = response.data.topics
                }
            }
    }
    
    static func favorite(id: String) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + UserService.shared.bearer,
            "Accept-Encoding": "gzip, deflate",
            "User-Agent": "okhttp/3.12.1",
            "Client-Secret": "eabb8841-258d-4561-89a6-66c6501dee83",
            "Content-Type": "application/x-www-form-urlencoded",
            "Connection": "close"
        ]
        
        let parameters: [String: String] = [
            "Id": id
        ]
        
        AF.request("https://api.eksisozluk.com/v2/entry/favorite", method: .post,parameters: parameters, headers: headers)
            .responseDecodable(of: FavoriteModelDAO.self) { response in
            }
            .responseString { response in
            }
    }
    
    static func unFavorite(id: String) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + UserService.shared.bearer,
            "Accept-Encoding": "gzip, deflate",
            "User-Agent": "okhttp/3.12.1",
            "Client-Secret": "eabb8841-258d-4561-89a6-66c6501dee83",
            "Content-Type": "application/x-www-form-urlencoded",
            "Connection": "close"
        ]
        
        let parameters: [String: String] = [
            "Id": id
        ]
        
        AF.request("https://api.eksisozluk.com/v2/entry/unfavorite", method: .post,parameters: parameters, headers: headers)
            .responseDecodable(of: FavoriteModelDAO.self) { response in
                print(response)
            }
            .responseString { response in
                print(response)
            }
    }
    
    static func getToken(username: String, password: String, completion: @escaping (String?) -> Void) {
        let headers: HTTPHeaders = [
            "Host": "api.eksisozluk.com",
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept-Encoding": "gzip, deflate",
            "User-Agent": "okhttp/3.12.1",
            "Connection": "close"
        ]
        
        let parameters: [String: String] = [
            "Api-Secret": "68f779c5-4d39-411a-bd12-cbcc50dc83dd",
            "Client-Secret": "eabb8841-258d-4561-89a6-66c6501dee83",
            "ClientUniqueId": "1a62383d-742e-4bcf-bf77-2fe1a1edcd39",
            "grant_type":"password",
            "password":password,
            "username":username
        ]
        
        AF.request("https://api.eksisozluk.com/Token", method: .post, parameters: parameters, headers: headers)
            .responseDecodable(of: BearerToken.self) { response in
                debugPrint(response)
                if let token = response.value {
                    completion(token.accessToken)
                } else {
                    completion(nil)
                }
            }.responseString { response in
                debugPrint(response)
            }
    }
}
