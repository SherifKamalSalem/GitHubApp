//
//  RootView.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import SwiftUI
import Factory

struct RootView: View {
    @StateObject private var coordinator = Container.shared.coordinator()
    @Injected(\.sessionManager) private var sessionManager
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            Group {
                if sessionManager.isAuthenticated {
                    RepositoriesView()
                } else {
                    LoginView()
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .addRepository:
                    AddRepositoryView()
                case .confirmRepository:
                    ConfirmRepositoryView()
                case .success:
                    SuccessView()
                case .login:
                    LoginView()
                case .repositories:
                    RepositoriesView()
                }
            }
        }
        .environmentObject(coordinator)
    }
}
