//
//  RepositoriesRepository.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import Factory

struct RepositoriesRepository {
    // MARK: - Dependencies
    
    @Injected(\.repositoriesAPIClient) private var client
    
    // MARK: - Privates
    
    private func convert(_ response: [RepositoryNetworkResponse]?)
    -> [RepositoryResponseProtocol]?
    {
        response?.compactMap { repository in
            RepositoryResponse(
                repositoryName: repository.repositoryName,
                isPrivate: repository.isPrivate,
                repositoryURL: repository.repositoryURL,
                description: repository.description,
                repositorySize: repository.repositorySize,
                repositoryForksCount: repository.repositoryForksCount,
                repositoryStarsCount: repository.repositoryStarsCount,
                repositoryOpenIssuesCount: repository.repositoryOpenIssuesCount,
                repositoryWatchersCount: repository.repositoryWatchersCount,
                repositoryDefaultBranch: repository.repositoryDefaultBranch,
                cloneURL: repository.cloneURL,
                programmingLanguage: repository.programmingLanguage,
                updatedAt: repository.updatedAt
            )
        }
    }
    
    private func convert(_ response: RepositoriesNetworkResponse?)
    -> RepositoriesRepositoryResponseProtocol
    {
        RepositoriesRepositoryResponse(
            totalRepositoriesCount: response?.totalRepositoriesCount,
            repositories: convert(response?.repositories)
        )
    }
}

// MARK: -  RepositoriesRepositoryProtocol

extension RepositoriesRepository: RepositoriesRepositoryProtocol {
    func getCurrentUserRepositories() async throws -> [RepositoryResponseProtocol]? {
        var repositories: [RepositoryResponseProtocol]?
        do {
            let response = try await client.getCurrentUserRepositories()
            let mappedResponse = convert(response)
            repositories = mappedResponse
        } catch {
            guard let error = error as? SessionDataTaskError else {
                throw RepositoryError.unowned
            }
            throw RepositoryError(error: error)
        }
        return repositories
    }
    
    func getRepositories(
        parameters: RepositoriesSearchParametersProtocol
    ) async throws -> [RepositoryResponseProtocol]? {
        var repositories: [RepositoryResponseProtocol]?
        do {
            let response = try await client.getRepositories(parameters: parameters)
            let mappedResponse = convert(response)
            repositories = mappedResponse.repositories
        } catch {
            guard let error = error as? SessionDataTaskError else {
                throw RepositoryError.unowned
            }
            throw RepositoryError(error: error)
        }
        return repositories
    }
}
