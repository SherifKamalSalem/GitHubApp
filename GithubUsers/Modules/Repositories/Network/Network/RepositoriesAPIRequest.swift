//
//  RepositoriesAPIRequest.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import Foundation
import Factory

enum RepositoriesAPIRequest: APIRequestConfiguration {
    case getCurrentUserRepositories
    case getRepositories(parameters: RepositoriesSearchParametersProtocol)
    
    var method: HTTPMethod {
        switch self {
        case .getRepositories, .getCurrentUserRepositories:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .getCurrentUserRepositories:
            return "https://api.github.com/user/repos"
        case .getRepositories(let parameters):
            return "https://api.github.com/search/repositories?q=\(parameters.searchableText)"
        }
    }
    
    var parameters: Parameters? {
        nil
    }
    
    var headers: HTTPHeaders? {
        var header = [String: String]()
        header["Authorization"] = "token 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"
        return header
    }
}

protocol RepositoriesSearchParametersProtocol {
    var searchableText: String { get }
}
