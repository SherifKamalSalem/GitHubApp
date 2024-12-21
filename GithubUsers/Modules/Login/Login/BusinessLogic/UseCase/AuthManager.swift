//
//  AuthManager.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 18/12/2024.
//
import Factory
import Foundation

@MainActor
class SessionManager: ObservableObject {
    @Injected(\.user) private var user
    @Injected(\.authToken) private var token
    @Injected(\.coordinator) private var coordinator
    
    @Published private(set) var isAuthenticated = false
    init() {
        print("🔐 SessionManager initialized")
    }
    deinit {
        print("🔐 SessionManager deallocated")
    }
    
    func login(user: User, token: String) async {
        print("🚀 Login: Starting session")
        print("📝 Registering auth token")
        Container.shared.authToken.register { token }
        print("👤 Registering user: \(user.name ?? "unnamed")")
        Container.shared.user.register { user }
        isAuthenticated = true
        print("✅ Login complete - Session started")
    }
    func logout() async {
        print("🚪 Logout: Starting cleanup")
        SessionScopeManager.shared.clearSessionData()
        isAuthenticated = false
        print("🔑 Auth token persists: \(token ?? "nil")")
        print("✅ Logout complete - Session ended")
        coordinator.popToRoot(toLogin: true)
    }
}

class SessionScopeManager {
    static let shared = SessionScopeManager()
    func clearSessionData() {
        print("🧹 Clearing session data")
        // Reset all session-related containers
        Container.shared.user.reset()
        Container.shared.sessionManager.reset()
        Container.shared.reset()
    }
}
