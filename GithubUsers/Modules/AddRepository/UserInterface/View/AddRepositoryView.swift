//
//  AddRepositoryView.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 19/12/2024.
//

import SwiftUI
import Factory

struct AddRepositoryView: View {
    @StateObject private var viewModel = Container.shared.addRepositoryViewModel()
    @EnvironmentObject private var coordinator: NavigationCoordinator
    var body: some View {
        Form {
            Section(header: Text("Repository Details")) {
                TextField("Repository Name", text: $viewModel.name)
                TextField("Description", text: $viewModel.description)
                TextField("Programming Language", text: $viewModel.language)
            }
            Section {
                Button("Submit") {
                    viewModel.submitForm()
                    coordinator.navigateToConfirm()
                }
                .disabled(viewModel.name.isEmpty)
            }
        }
        .navigationTitle("New Repository")
        .onAppear {
            print("📱 AddRepositoryView appeared")
        }
        .onDisappear {
            print("👋 AddRepositoryView disappeared")
        }
    }
}
