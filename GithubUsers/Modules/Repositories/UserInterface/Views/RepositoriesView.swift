//
//  RepositoriesView.swift
//  GithubUsers
//

import Factory
import SwiftUI

struct RepositoriesView: View {
    // MARK: - Dependencies
    @ObservedObject private var viewModel = Container.shared.repositoriesViewModel()
    
    // MARK: - Views
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                ZStack {
                    VStack {
                        List(viewModel.repositoriesArray) { repository in
                            RepositoryCard(repository: repository)
                        }
                        .listRowSeparator(.visible)
                        
                        .listStyle(.plain)
                        .opacity(viewModel.isSearchWorking ? 1 : 0)
                    }
                    SearchNoResultsView()
                        .opacity(viewModel.isSearchWorking ? 0 : 1)
                }
            }
        }
        .searchable(text: $viewModel.searchText)
        .onChange(of: viewModel.searchText) { _ in
            viewModel.checkSearchableText()
        }
        .task {
            await viewModel.fetchRepositories()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.navigateToAddRepository()
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button("Logout") {
                    Task {
                        await viewModel.logout()
                    }
                }
            }
        }
    }
}

struct RepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesView()
    }
}
