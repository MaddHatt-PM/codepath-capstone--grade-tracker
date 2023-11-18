//
//  NSSet+Extensions.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/12/23.
//

import CoreData
import Foundation

extension NSSet {
  func toArray<T>() -> [T] {
    let array = self.map { $0 as! T }
    return array
  }
}
