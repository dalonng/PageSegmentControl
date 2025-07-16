//
//  TwitterView.swift
//  Example (iOS)
//
//  Copyright © 2022 Xmartlabs SRL. All rights reserved.
//

import PageSegmentControl
import SwiftUI

private struct PageItem: Identifiable {
  var id: Int { tag }
  var tag: Int
  var title: String
  var posts: [Post]
  var withDescription: Bool = true
}

struct TwitterView: View {
  @State var selection = 4
  @State var swipeGestureEnabled = true

  private var items = [
    PageItem(tag: 1, title: "People", posts: TweetsModel().posts),
    PageItem(tag: 2, title: "Request", posts: TweetsModel().posts),
  ]

  @MainActor var body: some View {
    PagerTabStripView(swipeGestureEnabled: $swipeGestureEnabled, selection: $selection) {
      ForEach(items, id: \.title) { item in
        PostsList(items: item.posts, withDescription: item.withDescription)
          .pagerTabItem(tag: item.tag) {
            TabBarView(
              tag: item.tag,
              title: item.title,
              selection: $selection
            )
            .background(Color.red)
          }
      }
    }
    .pagerTabStripViewStyle(
      .barButton(
        tabItemSpacing: 15,
        tabItemHeight: 50,
        indicatorViewHeight: 3,
        indicatorView: {
          Rectangle().fill(.blue).cornerRadius(5)
        }
      )
    )
    .navigationBarItems(trailing:
      HStack {
        Button(swipeGestureEnabled ? "Swipe On" : "Swipe Off") {
          swipeGestureEnabled.toggle()
        }
      }
    )
  }
}

private struct TabBarView<SelectionType: Hashable & Sendable>: View {
  @EnvironmentObject private var pagerSettings: PagerSettings<SelectionType>
  @Environment(\.colorScheme) var colorScheme
  @Binding var selection: SelectionType
  let tag: SelectionType
  let title: String

  init(tag: SelectionType, title: String, selection: Binding<SelectionType>) {
    self._selection = selection
    self.tag = tag
    self.title = title
  }

  @MainActor var body: some View {
    VStack {
      let selectedColor: Color = colorScheme == .dark ? .white : .black
      Text(title)
        .foregroundColor(.gray.interpolateTo(color: selection == tag ? selectedColor : Color(.systemGray),
                                             fraction: pagerSettings.transition.progress(for: tag)))
        .font(.subheadline.bold())
        .frame(maxHeight: .infinity)
        .animation(.default, value: selection)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
    .frame(height: 40)
  }
}

#Preview {
  TwitterView()
}
