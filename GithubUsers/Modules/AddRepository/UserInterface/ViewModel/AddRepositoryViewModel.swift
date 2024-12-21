//
//  AddRepositoryViewModel.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 19/12/2024.
//

import Foundation
import Factory

@MainActor
class AddRepositoryViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var description = ""
    @Published var language = ""
    init() {
        print("🟢 AddRepositoryViewModel initialized")
    }
    deinit {
        print("🔴 AddRepositoryViewModel deallocated by graph scope")
    }
    func submitForm() {
        let repository = RepositoryViewItem(
            repositoryName: name,
            programmingLanguage: language,
            description: description
        )
        print("💾 Registering repository: '\(name)' in graph-scoped container")
        Container.shared.repository.register { repository }
    }
}
