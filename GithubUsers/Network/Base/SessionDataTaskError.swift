//
//  SessionDataTaskError.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import Foundation

enum SessionDataTaskError: Error {
  case failWithError(Error)
  case noData
  case notFound
  case notAuthorized
  case server
  case noInternetConnection
}
