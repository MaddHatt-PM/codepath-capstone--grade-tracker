//
//  TextFieldStyles.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/24/23.
//

import Foundation
import SwiftUI

struct LongEntryTextFieldStyle: TextFieldStyle {
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
//      .frame(maxWidth: .infinity, minHeight: 80, alignment: .top)
      .textFieldStyle(PlainTextFieldStyle())
//      .padding(.vertical)
      .multilineTextAlignment(.leading)
      .background {}
  }
}
