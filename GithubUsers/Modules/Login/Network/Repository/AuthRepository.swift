//
//  AuthRepository.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 17/12/2024.
//

import Foundation
import Factory

struct AuthRepository: AuthRepositoryProtocol {
    // MARK: - Privates
    @Injected(\.authAPIClient) private var client
    
    func login() async throws -> User? {
        var user: User?
        do {
            user = try await client.login()
            return user
        } catch {
            guard let error = error as? SessionDataTaskError else {
                throw RepositoryError.unowned
            }
            throw RepositoryError(error: error)
        }
    }
}
