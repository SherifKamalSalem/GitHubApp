//
//  LoginViewModel.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 18/12/2024.
//


import Foundation
import Factory
import Combine

// View Model
class LoginViewModel: ObservableObject {
    @Published var username = "username"
    @Published var password = "password"
    @Published var isLoading = false
    @Published var error: String?
    
    @Injected(\.authUseCase) private var authUseCase
    @Injected(\.sessionManager) private var sessionManager
    @Injected(\.coordinator) private var coordinator
    @Injected(\.authToken) private var token
    
    @MainActor
    func login() async {
        isLoading = true
        error = nil
        
        do {
            if let user = try await authUseCase.login() {
                await sessionManager.login(user: user, token: token ?? "")
                coordinator.navigate(to: .repositories)
            }
        } catch {
            print(error)
        }
        
        isLoading = false
    }
}
