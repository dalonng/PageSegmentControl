//
//  PostRow.swift
//  Example (iOS)
//
//  Copyright © 2022 Xmartlabs SRL. All rights reserved.
//

import SwiftUI

struct PostRow: View {
  var post: Post
  var withDescription: Bool = true

  @MainActor var body: some View {
    HStack(alignment: .top) {
      Image("defaultImage")
        .resizable()
        .frame(width: 70, height: 70, alignment: .leading)
        .cornerRadius(5)
        .padding(.vertical)
      VStack(alignment: .leading) {
        if withDescription {
          Text(post.user.name)
            .bold()
          Text(post.text)
        } else {
          Spacer()
          Text(post.user.name)
            .bold()
          Spacer()
        }
      }
      .padding()
    }
  }
}

#Preview {
  Group {
    PostRow(post: PostsFactory.shared.posts[0])
    PostRow(post: PostsFactory.shared.posts[1])
  }
}
