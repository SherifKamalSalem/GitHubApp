//
//  SuccessView.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 19/12/2024.
//

import SwiftUI
import Factory

struct SuccessView: View {
   @StateObject private var viewModel = Container.shared.successViewModel()
   @EnvironmentObject private var coordinator: NavigationCoordinator
   var body: some View {
       VStack(spacing: 20) {
           Image(systemName: "checkmark.circle.fill")
               .font(.system(size: 60))
               .foregroundColor(.green)
           Text("Repository Created Successfully!")
               .font(.title2)
               .multilineTextAlignment(.center)
           if let repository = viewModel.repository {
               Text("Repository '\(repository.repositoryName)' is ready!")
                   .foregroundColor(.secondary)
           }
           Button("Exit") {
               print("🔄 Navigating to root - graph scope will cleanup automatically")
               coordinator.navigateToRepositories()
           }
           .buttonStyle(.borderedProminent)
       }
       .padding()
       .navigationBarBackButtonHidden(true)
       .onAppear {
           print("📱 SuccessView appeared")
       }
       .onDisappear {
           print("👋 SuccessView disappeared - graph scope cleanup starting")
       }
   }
}
