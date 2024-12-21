//
//  AuthUseCase.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 18/12/2024.
//


import Factory

final class AuthUseCase: AuthUseCaseProtocol {
    // MARK: - Dependencies
    
    @Injected(\.authRepository) private var repository
    
    func login() async throws -> User? {
        guard let user = try await repository.login() else {
            return nil
        }
        return user
    }
}
