//
//  UIPickedTextField.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/24/23.
//

import Foundation
import SwiftUI
import UIKit

class UIPickerTextField: UITextField {
  var data: [String]
  @Binding var selectedIndex: Int?
  
  private lazy var pickerView: UIPickerView = {
    let pickerView = UIPickerView()
    pickerView.delegate = self
    pickerView.dataSource = self
    return pickerView
  }()
  
  private lazy var toolbar: UIToolbar = {
    let toolbar = UIToolbar()
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donePressed))
    
    toolbar.setItems([flexibleSpace, doneButton], animated: false)
    toolbar.sizeToFit()
    return toolbar
  }()
  
  @objc
  private func donePressed() {
    self.selectedIndex = self.pickerView.selectedRow(inComponent: 0)
    self.endEditing(true)
  }
  
  init(data: [String], selectedIndex: Binding<Int?>) {
    self.data = data
    self._selectedIndex = selectedIndex
    super.init(frame: .zero)
    
    self.inputView = self.pickerView
    self.inputAccessoryView = self.toolbar
    self.tintColor = .clear
    
    
    guard let selectedIndex = selectedIndex.wrappedValue else {
      return
    }
    
    self.pickerView.selectRow(selectedIndex, inComponent: 0, animated: true)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not be implemented.")
  }
}

extension UIPickerTextField: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return self.data.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return self.data[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    self.selectedIndex = row
  }
}
