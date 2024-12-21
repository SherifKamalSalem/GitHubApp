//
//  ImagePlaceholderView.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import SwiftUI

struct ImagePlaceholderView: View {
  var body: some View {
    Image(systemName: "photo.fill")
      .resizable()
      .scaledToFit()
      .frame(
        width: 100,
        height: 80,
        alignment: .leading
      )
      .foregroundColor(.gray)
  }
}

struct ImagePlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePlaceholderView()
    }
}
