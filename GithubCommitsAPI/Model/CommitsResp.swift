//
//  CommitsResp.swift
//  GithubCommitsAPI
//
//  Created by MAC on 19/10/2020.
//  Copyright © 2020 RoyalTech. All rights reserved.
//

import Foundation
import ObjectMapper

struct CommitsResp : Codable {
    let sha : String?
    let node_id : String?
    let commit : Commit?

    enum CodingKeys: String, CodingKey {

        case sha = "sha"
        case node_id = "node_id"
        case commit = "commit"
    }

    init(_ dictionary: [String: Any]) throws {
        //let values = try dictionary.container(keyedBy: CodingKeys.self)
        sha = dictionary["sha"] as? String ?? ""
        node_id = dictionary["node_id"] as? String ?? ""
        commit = dictionary["commit"] as? Commit
    }

}

struct Commit : Codable {
    let author : Author?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case author = "author"
        case message = "message"
    }

    init(_ dictionary: [String: Any]) throws {
        author = dictionary["author"] as? Author
        message = dictionary["message"] as? String ?? ""

    }

}


struct Author : Codable {
    let name : String?
    let email : String?
    let date : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case email = "email"
        case date = "date"
    }

    init(_ dictionary: [String: Any]) throws {
        name = dictionary["name"] as? String ?? ""
        email = dictionary["email"] as? String ?? ""
        date = dictionary["date"] as? String ?? ""
    }

}
