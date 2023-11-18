//
//  WeightGroup+Extensions.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation

public extension WeightGroup {
  convenience init(_ context: NSManagedObjectContext,
                   name: String,
                   rawWeight: Double = -1)
  {
    self.init(context: context)
    self.nameRaw = name

    self.weightRaw = rawWeight

    self.creationDate = .now
    self.lastModifiedDate = .now
    self.uuidRaw = UUID()
    DatabaseStore.saveDatabase(context: context)
  }

  var name: String { self.nameRaw ?? "Invalid weight-group name" }

  var uuid: UUID {
    guard let uuidRaw = uuidRaw else {
      print("UUIDRaw was unexpectedly nil, regenerating for \(self.name)")
      let uuid = UUID()
      self.uuidRaw = uuid
      self.save(context: DatabaseStore.shared.container.viewContext)
      return uuid
    }
    return uuidRaw
  }

  func getAssignmentsArray() -> [Assignment] {
    Array(assignments as? Set<Assignment> ?? [])
  }

  var assignmentsArrayForDisplay: [Assignment] {
    self.getAssignmentsArray().sorted { $0.creationDate! < $1.creationDate! }
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
    if weightRaw <= 0 {
      return false
    }

    if self.getAssignmentsArray().count == 0 {
      return false
    }

    return true
  }
}
