//
//  RepositoriesUseCaseProtocol.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import Foundation

protocol RepositoriesUseCaseProtocol {
    func getCurrentUserRepositories() async -> [RepositoryProtocol]
    func retrieve(using searchText: String) async -> [RepositoryProtocol]
    func logout() async
    func checkSearchState(for searchText: String) -> Bool
    func notifyLoading() -> Bool
    func stopLoading() -> Bool
}

protocol RepositoryProtocol {
    var repositoryName: String { get }
    var isPrivate: Bool { get }
    var repositoryURL: String { get }
    var description: String { get }
    var repositorySize: Double { get }
    var repositoryForksCount: Int { get }
    var repositoryStarsCount: Int { get }
    var repositoryOpenIssuesCount: Int { get }
    var repositoryWatchersCount: Int { get }
    var repositoryDefaultBranch: String { get }
    var cloneURL: String { get }
    var programmingLanguage: String { get }
    var updatedAt: String { get }
    var license: String { get }
}
