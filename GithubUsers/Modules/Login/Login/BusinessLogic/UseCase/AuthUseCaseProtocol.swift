//
//  UsersUseCaseProtocol.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 18/12/2024.
//


import Foundation

protocol AuthUseCaseProtocol {
    func login() async throws -> User?
}
