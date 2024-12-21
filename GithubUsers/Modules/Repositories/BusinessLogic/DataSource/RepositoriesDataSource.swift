//
//  RepositoriesDataSource.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import Foundation

struct RepositoriesDataSource: RepositoriesDataSourceProtocol {
  var repositories: [RepositoryProtocol] = []
  var isLoading = true
}
