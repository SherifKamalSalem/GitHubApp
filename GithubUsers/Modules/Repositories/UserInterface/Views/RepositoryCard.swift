//
//  RepositoryCard.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import SwiftUI

struct RepositoryCard: View {
  @State var repository: RepositoryViewItem
  var body: some View {
    VStack(alignment: .leading, spacing: 8.0) {
      HStack(spacing: 8.0) {
        Text(repository.repositoryName)
          .foregroundColor(.purple.opacity(0.8))
          .font(.title3)
          .fontWeight(.heavy)
        Text(repository.repositoryPrivateStatus)
          .fontWeight(.bold)
          .foregroundColor(.gray)
          .padding(.horizontal, 8)
          .padding(.vertical, 4)
          .clipShape(RoundedRectangle(cornerRadius: 12.0))
          .overlay(
            RoundedRectangle(cornerRadius: 16.0)
              .stroke(.gray.gradient, lineWidth: 1)
          )
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      if !(repository.description.isEmpty) {
        Text(repository.description)
          .foregroundColor(.gray.opacity(0.7))
          .fontWeight(.semibold)
          .lineLimit(2)
          .multilineTextAlignment(.leading)
      }
      HStack(spacing: 16.0) {
        if !(repository.programmingLanguage.isEmpty) {
          Text(repository.programmingLanguage)
        }
        HStack(spacing: 2) {
          Image(systemName: "star")
          Text("\(repository.repositoryStarsCount)")
        }
        HStack(spacing: 2) {
          Image(systemName: "tuningfork")
          Text("\(repository.repositoryForksCount)")
        }
        VStack(spacing: 2) {
          Text("Updated on")
          Text("\(repository.updatedAt)")
        }
      }
      .foregroundColor(.gray.opacity(0.9))
    }
  }
}
