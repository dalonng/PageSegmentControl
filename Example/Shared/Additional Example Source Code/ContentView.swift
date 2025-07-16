//
//  ContentView.swift
//  Shared
//
//  Copyright © 2022 Xmartlabs SRL. All rights reserved.
//

import PageSegmentControl
import SwiftUI

struct ContentView: View {
  @MainActor var body: some View {
    NavigationView {
      List {
        NavigationLink(destination: TwitterView()) {
          VStack(alignment: .leading) {
            Text("Twitter Style").font(.body).padding(.bottom, 1)
            Text("Scrolleable BarButtonStyle with Label").font(.subheadline)
          }
          .padding([.top, .bottom], 2)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
