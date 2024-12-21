//
//  RepositoriesDIContainer.swift
//  GithubRepositories
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import Factory

extension Container {
    var repositoriesAPIClient: Factory<RepositoriesAPIClientProtocol> {
        self { RepositoriesAPIClient() }
    }
    
    var repositoriesRepository: Factory<RepositoriesRepositoryProtocol> {
        self { RepositoriesRepository() }
    }
    
    var repositoriesDataSource: Factory<RepositoriesDataSourceProtocol> {
        self { RepositoriesDataSource() }
    }
    
    var repositoriesUseCase: Factory<RepositoriesUseCaseProtocol> {
        self { RepositoriesUseCase() }
    }
    
    @MainActor
    var repositoriesViewModel: Factory<RepositoriesViewModel> {
        self { @MainActor in
            print("🏗️ Creating RepositoriesViewModel")
            return RepositoriesViewModel()
        }
        .scope(.graph)
    }
}
