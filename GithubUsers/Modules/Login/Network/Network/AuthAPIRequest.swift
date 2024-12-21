//
//  AuthAPIRequest.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 17/12/2024.
//

import Foundation
import Factory

enum AuthAPIRequest: APIRequestConfiguration {
    case login
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .GET
        }
    }
    var path: String {
        switch self {
        case .login:
            return "https://api.github.com/user"
        }
    }
    var parameters: Parameters? {
        return nil
    }
    var headers: HTTPHeaders? {
        switch self {
        case .login:
            var header = [String: String]()
            header["Authorization"] = "token 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"
            return header
        }
    }
}
