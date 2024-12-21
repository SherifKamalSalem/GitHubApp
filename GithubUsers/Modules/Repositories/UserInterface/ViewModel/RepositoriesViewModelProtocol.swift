//
//  RepositoriesViewModelProtocol.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import Foundation

protocol RepositoriesViewModelProtocol: ObservableObject {
    var isLoading: Bool { get }
    func fetchRepositories(with searchText: String?) async
    func checkSearchableText()
    func logout() async
}

struct RepositoryViewItem: Identifiable {
    var id = UUID()
    var repositoryName: String
    var repositoryPrivateStatus: String
    var repositoryURL: String
    var description: String
    var repositorySize: Double
    var repositoryForksCount: Int
    var repositoryStarsCount: Int
    var repositoryOpenIssuesCount: Int
    var repositoryWatchersCount: Int
    var repositoryDefaultBranch: String
    var cloneURL: String
    var programmingLanguage: String
    var updatedAt: String
    var license: String
    
    init(id: UUID = UUID(), repositoryName: String, repositoryPrivateStatus: String, repositoryURL: String, description: String, repositorySize: Double, repositoryForksCount: Int, repositoryStarsCount: Int, repositoryOpenIssuesCount: Int, repositoryWatchersCount: Int, repositoryDefaultBranch: String, cloneURL: String, programmingLanguage: String, updatedAt: String, license: String) {
        self.id = id
        self.repositoryName = repositoryName
        self.repositoryPrivateStatus = repositoryPrivateStatus
        self.repositoryURL = repositoryURL
        self.description = description
        self.repositorySize = repositorySize
        self.repositoryForksCount = repositoryForksCount
        self.repositoryStarsCount = repositoryStarsCount
        self.repositoryOpenIssuesCount = repositoryOpenIssuesCount
        self.repositoryWatchersCount = repositoryWatchersCount
        self.repositoryDefaultBranch = repositoryDefaultBranch
        self.cloneURL = cloneURL
        self.programmingLanguage = programmingLanguage
        self.updatedAt = updatedAt
        self.license = license
    }
    
    init(repositoryName: String, programmingLanguage: String, description: String) {
        self.repositoryName = repositoryName
        self.programmingLanguage = programmingLanguage
        self.description = description
        self.id = UUID()
        self.repositoryPrivateStatus = ""
        self.repositoryURL = ""
        self.repositorySize = 0.0
        self.repositoryForksCount = 0
        self.repositoryStarsCount = 0
        self.repositoryOpenIssuesCount = 0
        self.repositoryWatchersCount = 0
        self.repositoryDefaultBranch = ""
        self.cloneURL = ""
        self.updatedAt = ""
        self.license = ""
    }
}
