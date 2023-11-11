//
//  WeightGroup+Extensions.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation

public extension WeightGroup {
  func create(_ context: NSManagedObjectContext,
              name: String,
              rawWeight: Double = -1)
  {
    self.name = name
    self.rawWeight = rawWeight
    self.creationDate = .now
    self.lastModifiedDate = .now
    self.uuid = UUID()
    DatabaseStore.saveDatabase(context: context)
  }

  func addToAssignments(assignments: [Assignment]) {
    assignments.forEach { item in
      self.addToAssignments(item)
    }
  }

  func save(context: NSManagedObjectContext) {
    self.lastModifiedDate = .now
    DatabaseStore.saveDatabase(context: context)
  }

  var average: Double {
    let grades = Array(assignments as? Set<Assignment> ?? [])
      .filter { $0.isValid }
      .map { $0.grade }
    return Double(grades.reduce(0, +)) / Double(grades.count)
  }

  var isValid: Bool {
    if rawWeight <= 0 {
      return false
    }

    let assignmentsArray = Array(assignments as? Set<Assignment> ?? []).filter { $0.isValid }
    if assignmentsArray.count == 0 {
      return false
    }

    return true
  }
}
