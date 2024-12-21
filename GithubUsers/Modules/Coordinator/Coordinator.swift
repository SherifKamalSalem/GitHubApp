//
//  Coordinator.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 18/12/2024.
//

import Factory
import SwiftUI

enum Route: Hashable {
    case login
    case repositories
    case addRepository
    case confirmRepository
    case success
}

@MainActor
class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: Route) {
        path.append(route)
    }
    
    func navigateToRoot() {
        path.removeLast(path.count)
    }
    
    func navigateToAddRepository() {
        path.append(Route.addRepository)
    }
    
    func navigateToRepositories() {
        path.append(Route.repositories)
    }
    
    func navigateToConfirm() {
        path.append(Route.confirmRepository)
    }
    
    func navigateToSuccess() {
        path.append(Route.success)
    }
    
    func popToRoot(toLogin: Bool = false) {
        if toLogin {
            path.removeLast(path.count)
        } else {
            path.removeLast(path.count)
            path.append(Route.repositories)
        }
    }
}

extension Container {
    var coordinator: Factory<NavigationCoordinator> {
        self { @MainActor in NavigationCoordinator() }
            .singleton
    }
}
