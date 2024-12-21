//
//  OptionView.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import SwiftUI

struct OptionView: View {
  @Binding var title: String
  var body: some View {
    Text(title)
      .foregroundColor(.white)
      .fontWeight(.semibold)
      .frame(
        minWidth: 80,
        maxWidth: .infinity,
        minHeight: 40,
        alignment: .center)
      .background(.purple.gradient.opacity(0.7))
      .cornerRadius(8)
  }
}

#if DEBUG
struct OptionView_Previews: PreviewProvider {
  static var previews: some View {
    let title = "Option Title"
    OptionView(title: .constant(title))
  }
}
#endif
