//
//  LoginView.swift
//  GithubUsers
//
//  Created by Sherif Kamel Salem on 18/12/2024.
//

import SwiftUI
import Factory

struct LoginView: View {
    @State private var loginViewModel = Container.shared.loginViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            
            TextField("Username", text: $loginViewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            SecureField("Password", text: $loginViewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if loginViewModel.isLoading {
                ProgressView()
            } else {
                Button(action: {
                    Task {
                        await loginViewModel.login()
                    }
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            
            if let error = loginViewModel.error {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
        
        .padding()
        .navigationTitle("GitHub Login")
    }
}
