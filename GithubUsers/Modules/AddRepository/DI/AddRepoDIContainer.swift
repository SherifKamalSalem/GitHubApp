//
//  AddRepoDIContainer.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 19/12/2024.
//

import Foundation
import Factory


extension Container {
   var repository: Factory<RepositoryViewItem?> {
       self {
           print("📦 Initializing repository container with nil value")
           return nil
       }
       .graph
   }
   @MainActor
   var addRepositoryViewModel: Factory<AddRepositoryViewModel> {
       self { @MainActor in
           print("🏗️ Creating new AddRepositoryViewModel instance")
           return AddRepositoryViewModel()
       }
       .graph
   }
   @MainActor
   var confirmRepositoryViewModel: Factory<ConfirmRepositoryViewModel> {
       self { @MainActor in
           print("🏗️ Creating new ConfirmRepositoryViewModel instance")
           return ConfirmRepositoryViewModel()
       }
       .shared
   }
   @MainActor
   var successViewModel: Factory<SuccessViewModel> {
       self { @MainActor in
           print("🏗️ Creating new SuccessViewModel instance")
           return SuccessViewModel()
       }
       .graph
   }
}
