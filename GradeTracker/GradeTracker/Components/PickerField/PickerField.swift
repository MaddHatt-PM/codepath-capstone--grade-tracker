//
//  PickerField.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/24/23.
//

import Foundation
import SwiftUI

struct PickerField: UIViewRepresentable {
  @Binding var selectedIndex: Int?
  
  private var placeholder: String
  private var data: [String]
  private let textField: UIPickerTextField
  
  init<S>(_ title: S, data: [String], selectionIndex: Binding<Int?>) where S: StringProtocol {
    self.placeholder = String(title)
    self.data = data
    self._selectedIndex = selectionIndex
    
    self.textField = UIPickerTextField(data: data, selectedIndex: selectionIndex)
  }
  
  func makeUIView(context: Context) -> UITextField {
    textField.placeholder = placeholder
    textField.textAlignment = .right
    textField.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
    textField.layoutMargins = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    return textField
  }
  
  func updateUIView(_ uiView: UITextField, context: Context) {
    if let index = selectedIndex {
      uiView.text = data[index]
    } else {
      uiView.text = ""
    }
  }
}
