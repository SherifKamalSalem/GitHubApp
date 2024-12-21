//
//  RepositoriesAPIClient.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import Factory

protocol RepositoriesAPIClientProtocol {
    func getCurrentUserRepositories() async throws -> [RepositoryNetworkResponse]?
    func getRepositories(
        parameters: RepositoriesSearchParametersProtocol
    ) async throws -> RepositoriesNetworkResponse?
}

// MARK: - RepositoriesAPIClientProtocol

class RepositoriesAPIClient: RepositoriesAPIClientProtocol {
    private let client = Container.shared.baseAPIClient()
    
    func getCurrentUserRepositories() async throws -> [RepositoryNetworkResponse]? {
        let request = RepositoriesAPIRequest.getCurrentUserRepositories
        var response: [RepositoryNetworkResponse]?
        response = try await client.perform(request)
        return response
    }
    
    func getRepositories(
        parameters: RepositoriesSearchParametersProtocol
    ) async throws -> RepositoriesNetworkResponse? {
        let request = RepositoriesAPIRequest.getRepositories(parameters: parameters)
        var response: RepositoriesNetworkResponse?
        response = try await client.perform(request)
        return response
    }
}
