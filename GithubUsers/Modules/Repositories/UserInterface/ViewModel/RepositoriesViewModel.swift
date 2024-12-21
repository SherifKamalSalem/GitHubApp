//
//  RepositoriesViewModel.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import Factory
import Foundation

@MainActor
final class RepositoriesViewModel {
    // MARK: - Dependencies
    @Injected(\.repositoriesUseCase) private var useCase
    @Injected(\.coordinator) private var coordinator
    @Injected(\.sessionManager) private var sessionManager
    
    // MARK: - Constants
    
    private enum Constants {
        static let privateStatus = "Private"
        static let publicStatus = "Public"
    }
    
    // MARK: - Properties
    
    @Published private(set) var repositoriesArray: [RepositoryViewItem] = []
    @Published private(set) var isSearchWorking = false
    @Published var searchText = ""
    @Published var isLoading = false
    
    // MARK: - Privates
    
    private func convert(_ repository: RepositoryProtocol)
    -> RepositoryViewItem
    {
        RepositoryViewItem(
            repositoryName: repository.repositoryName,
            repositoryPrivateStatus: setPrivateStatus(repository.isPrivate),
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
            updatedAt: repository.updatedAt,
            license: repository.license
        )
    }
    
    private func setPrivateStatus(_ status: Bool?) -> String {
        (status ?? true) ? Constants.privateStatus : Constants.publicStatus
    }
    
    func navigateToAddRepository() {
        coordinator.navigateToAddRepository()
    }
}

// MARK: - RepositoriesViewModelProtocol

extension RepositoriesViewModel: RepositoriesViewModelProtocol {
    func fetchRepositories(with searchText: String? = nil) async {
        var repositories: [RepositoryProtocol]
        if let searchText {
            repositories = await useCase.retrieve(using: searchText)
        } else {
            repositories = await useCase.getCurrentUserRepositories()
            isSearchWorking = true
        }
        repositoriesArray = repositories.map { repository in
            convert(repository)
        }
    }
    
    func checkSearchableText() {
        isSearchWorking = useCase.checkSearchState(for: searchText)
        if isSearchWorking {
            isLoading = useCase.notifyLoading()
            Task {
                await fetchRepositories(with: searchText)
                isLoading = useCase.stopLoading()
            }
        }
    }
    
    func logout() async {
        await useCase.logout()
    }
}
