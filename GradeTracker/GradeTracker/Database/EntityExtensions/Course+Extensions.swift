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
  convenience init(_ context: NSManagedObjectContext,
                   name: String,

                   professor: String = "",
                   courseDescription: String = "",
                   courseIdentifier: String = "",
                   creditHours: Int32 = -1,
                   excludeFromGPA: Bool = false,

                   colorID: Int32 = 0,
                   iconID: Int32 = 0)
  {
    self.init(context: context)
    self.nameRaw = name

    self.professorRaw = professor
    self.courseDescriptionRaw = courseDescription
    self.courseIdentifierRaw = courseIdentifier
    self.creditHours = creditHours
    self.excludeFromGPA = excludeFromGPA

    self.colorID = colorID
    self.iconID = iconID

    self.creationDate = .now
    self.lastModifiedDate = .now
    self.uuidRaw = UUID()
    DatabaseStore.saveDatabase(context: context)
  }

  var name: String { self.nameRaw ?? "Nil course name" }
  var professor: String { self.professorRaw ?? "Nil course professor " }
  var courseDescription: String { self.courseDescriptionRaw ?? "Nil course description" }
  var courseIdentifier: String { self.courseIdentifierRaw ?? "Nil course identifier" }
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
    let weights = groups.map { $0.weightRaw }
    let weightSum = Double(weights.reduce(0, +))
    return weights.map { $0 / weightSum }
  }

  var weightedAverage: Double {
    let groups = Array(weightGroups as? Set<WeightGroup> ?? []).filter { $0.isValid }
    return zip(groups.map { $0.average }, self.normalizedWeights)
      .compactMap { $0 * $1 }
      .reduce(0, +)
  }

  var totalRawWeight: Double {
    let groups = Array(weightGroups as? Set<WeightGroup> ?? []).filter { $0.isValid }
    return Double(groups.map { $0.weightRaw }.reduce(0, +))
  }

  var weightGroupsForDisplay: [WeightGroup] {
    let weightGroups = Array(weightGroups as? Set<WeightGroup> ?? []).filter { $0.isValid }
    return weightGroups.sorted { $0.weightRaw < $1.weightRaw }
  }
}
