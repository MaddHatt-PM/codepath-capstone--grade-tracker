//
//  KeyboardAdaptive.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/24/23.
//

import Combine
import SwiftUI

struct KeyboardAdaptive: ViewModifier {
  @State var bottomPadding: CGFloat = 0

  func body(content: Content) -> some View {
    GeometryReader { geometry in
      content
        .padding(.bottom, self.bottomPadding)
        .animation(.easeOut(duration: 0.16))
        .onAppear(perform: {
          NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillShowNotification)
            .merge(with: NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillChangeFrameNotification))
            .compactMap { notification in
              notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect
            }
            .map { rect in
              rect.height - geometry.safeAreaInsets.bottom
            }
            .subscribe(Subscribers.Assign(object: self, keyPath: \.bottomPadding))

          NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillHideNotification)
            .compactMap { _ in
              CGFloat.zero
            }
            .subscribe(Subscribers.Assign(object: self, keyPath: \.bottomPadding))
        })
    }
  }
}

extension View {
  func keyboardAdaptive() -> some View {
    ModifiedContent(content: self, modifier: KeyboardAdaptive())
  }
}
