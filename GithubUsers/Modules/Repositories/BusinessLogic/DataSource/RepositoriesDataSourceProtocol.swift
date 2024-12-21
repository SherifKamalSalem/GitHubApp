//
//  RepositoriesDataSourceProtocol.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import Foundation

protocol RepositoriesDataSourceProtocol {
  var repositories: [RepositoryProtocol] { get set }
  var isLoading: Bool { get set }
}
