//
//  AuthAPIClient.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 17/12/2024.
//

import Foundation
import Factory

protocol AuthAPIClientProtocol {
    func login() async throws -> User?
}

class AuthAPIClient: AuthAPIClientProtocol {
  
    @Injected(\.baseAPIClient) private var client

    func login() async throws -> User? {
        let request = AuthAPIRequest.login
        var user: User?
        user = try await client.perform(request)
        return user
    }
}
