//
//  AuthDIContainer.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 18/12/2024.
//

import Factory


extension Container {
    // Long-lived dependencies (survive logout)
    var authToken: Factory<String?> {
        self {
            print("🔑 Creating auth token container")
            return "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"
        }
        .singleton // Persists even after logout
    }
    var baseAPIClient: Factory<BaseAPIClientProtocol> {
        self {
            print("🔧 Creating BaseAPIClient")
            return BaseAPIClient()
        }
        .singleton
    }
    
    var authAPIClient: Factory<AuthAPIClientProtocol> {
        self {
            print("🔧 Creating AuthAPIClient")
            return AuthAPIClient()
        }
        .singleton
    }
    // Session dependencies (cleared on logout)
    var user: Factory<User?> {
        self {
            print("👤 Initializing user container")
            return nil
        }
        .shared // Using shared scope for session data
    }
    var sessionManager: Factory<SessionManager> {
        self { @MainActor in
            print("🔐 Creating SessionManager")
            return SessionManager()
        }
        .shared // Using shared scope for session data
    }
    // Feature-specific dependencies
    var authUseCase: Factory<AuthUseCaseProtocol> {
        self {
            print("🛠️ Creating AuthUseCase")
            return AuthUseCase()
        }
        .scope(.shared)
    }
    @MainActor
    var loginViewModel: Factory<LoginViewModel> {
        self { @MainActor in
            print("🏗️ Creating LoginViewModel")
            return LoginViewModel()
        }
        .graph // Cleaned up when view disappears
    }
    
    var authRepository: Factory<AuthRepositoryProtocol> {
        self { AuthRepository() }
            .graph
    }
}
