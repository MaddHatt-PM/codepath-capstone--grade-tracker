//
//  BaseScreen.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/17/23.
//

import Foundation
import SwiftUI
import UIKit

struct BaseScreen<Content: View>: View {
  var content: () -> Content
  init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  var body: some View {
    ZStack {
      Color("Background")
        .ignoresSafeArea()

      content()
    }
  }
}

// #Preview {
//    BaseScreen()
// }
