//
//  Course+Extensions.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation
import SwiftUI

public extension Course {
  func create(context: NSManagedObjectContext,
              name: String,

              professor: String = "",
              courseDescription: String = "",
              courseIdentifier: String = "",
              creditHours: Int32 = -1,
              excludeFromGPA: Bool = false,

              colorID: Int32 = 0,
              iconID: Int32 = 0)
  {
    self.name = name

    self.professor = professor
    self.courseDescription = courseDescription
    self.courseIdentifier = courseIdentifier
    self.creditHours = creditHours
    self.excludeFromGPA = excludeFromGPA

    self.colorID = colorID
    self.iconID = iconID

    self.creationDate = .now
    self.lastModifiedDate = .now
    self.uuid = UUID()
    DatabaseStore.saveDatabase(context: context)
  }

  func save(context: NSManagedObjectContext) {
    self.lastModifiedDate = .now
    DatabaseStore.saveDatabase(context: context)
  }

  var color: Color {
    return Course.ColorIDs[self.colorID] ?? .indigo
  }

  var icon: Image {
    // TODO: Remove force unwrap
    return Image(Course.IconIDs[self.iconID]!)
  }

  var normalizedWeights: [Double] {
    let groups = Array(weightGroups as? Set<WeightGroup> ?? []).filter { $0.isValid }
    let weights = groups.map { $0.rawWeight }
    let weightSum = Double(weights.reduce(0, +))
    return weights.map { $0 / weightSum }
  }

  var weightedAverage: Double {
    let groups = Array(weightGroups as? Set<WeightGroup> ?? []).filter { $0.isValid }
    return zip(groups.map { $0.average }, self.normalizedWeights)
      .compactMap { $0 * $1 }
      .reduce(0, +)

//    let groupAverages = groups.map { $0.average }
//    let weights = self.normalizedWeights
  }
}
