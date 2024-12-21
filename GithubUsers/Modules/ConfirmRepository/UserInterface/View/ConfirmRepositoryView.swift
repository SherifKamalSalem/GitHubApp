//
//  ConfirmRepositoryView.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 19/12/2024.
//

import SwiftUI
import Factory
struct ConfirmRepositoryView: View {
    @StateObject private var viewModel = Container.shared.confirmRepositoryViewModel()
    @EnvironmentObject private var coordinator: NavigationCoordinator
    var body: some View {
        VStack(spacing: 20) {
            if let repository = viewModel.repository {
                Form {
                    Section(header: Text("Confirm Details")) {
                        LabeledContent("Repository Name", value: repository.repositoryName)
                        LabeledContent("Description", value: repository.description)
                        LabeledContent("Programming Language", value: repository.programmingLanguage)
                    }
                }
            }
            if viewModel.isLoading {
                ProgressView()
            } else {
                Button {
                    Task {
                        await viewModel.confirmAndCreate()
                    }
                } label: {
                    Text("Confirm & Create")
                        .foregroundStyle(.black)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle("Confirm Repository")
        .onAppear {
            print("📱 ConfirmRepositoryView appeared")
        }
        .onDisappear {
            print("👋 ConfirmRepositoryView disappeared")
        }
    }
}
