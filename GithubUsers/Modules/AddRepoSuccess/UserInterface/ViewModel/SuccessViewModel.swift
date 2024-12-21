//
//  SuccessViewModel.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 19/12/2024.
//

import Foundation
import Factory

@MainActor
class SuccessViewModel: ObservableObject {
    @Injected(\.repository) var repository
    
    
    init() {
        print("🟢 SuccessViewModel initialized")
        print("📥 Final repository state: \(repository?.repositoryName ?? "nil")")
    }
    deinit {
        print("🔴 SuccessViewModel deallocated by graph scope")
    }
}
