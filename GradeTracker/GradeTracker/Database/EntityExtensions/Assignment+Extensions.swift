//
//  Assignment+Extensions.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation

public extension Assignment {
  func create(_ context: NSManagedObjectContext,
              name: String,
              earnedPoints: Int32?,
              totalPoints: Int32?,
              enabled: Bool = false) -> Self
  {
    self.name = name

    self.earnedPoints = earnedPoints ?? -1
    self.totalPoints = totalPoints ?? -1
    self.enabled = enabled

    self.creationDate = .now
    self.lastModifiedDate = .now
    self.uuid = UUID()
    DatabaseStore.saveDatabase(context: context)
    return self
  }

  func save(context: NSManagedObjectContext) {
    self.lastModifiedDate = .now
    DatabaseStore.saveDatabase(context: context)
  }

  var isValid: Bool {
    if enabled == false { return false }
    return earnedPoints >= 0 && totalPoints >= 0
  }

  var grade: Double {
    return Double(earnedPoints) / Double(totalPoints)
  }
}
