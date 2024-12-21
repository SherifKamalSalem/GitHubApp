//
//  AuthRepositoryProtocol.swift
//  Login
//
//  Created by Sherif Kamel Salem on 17/12/2024.
//


protocol AuthRepositoryProtocol {
    func login() async throws -> User?
}
