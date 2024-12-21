//
//  User.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 19/12/2024.
//

import Foundation

struct User: Identifiable, Decodable {
    var id: Int
    var avatarUrl: String?
    var name: String?
    var email: String?
}
