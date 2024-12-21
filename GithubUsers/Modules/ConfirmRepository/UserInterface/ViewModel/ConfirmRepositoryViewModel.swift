//
//  ConfirmRepositoryViewModel.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 19/12/2024.
//

import Foundation
import Factory

@MainActor
class ConfirmRepositoryViewModel: ObservableObject {
    @Injected(\.repository) var repository
    @Injected(\.coordinator) private var coordinator
    @Published var isLoading = false
    @Published var error: String?
    init() {
        print("🟢 ConfirmRepositoryViewModel initialized")
        print("📥 Injected repository: \(repository?.repositoryName ?? "nil")")
    }
    deinit {
        print("🔴 ConfirmRepositoryViewModel deallocated by graph scope")
    }
    func confirmAndCreate() async {
        guard let repository = repository else {
            print("⚠️ No repository found to confirm")
            return
        }
        print("✅ Starting repository creation process for: \(repository.repositoryName)")
        isLoading = true
        error = nil
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("🚀 Repository creation successful")
            coordinator.navigateToSuccess()
        } catch {
            print("❌ Repository creation failed: \(error.localizedDescription)")
            self.error = error.localizedDescription
        }
        isLoading = false
    }
}
