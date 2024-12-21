//
//  RepositoryError.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import Foundation

enum RepositoryError: Error {
  case noInternetConnection
  case notFound
  case notAuthorized
  case server
  case noData
  case unowned

  init(error: SessionDataTaskError) {
    switch error {
      case .noInternetConnection:
        self = .noInternetConnection
      case .server:
        self = .server
      case .notFound:
        self = .notFound
      case .notAuthorized:
        self = .notAuthorized
      default:
        self = .unowned
    }
  }
}
