//
//  Assignment+Extensions.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation
import SwiftUI

public extension Assignment {
  convenience init(_ context: NSManagedObjectContext,
                   name: String,
                   earnedPoints: Int32?,
                   totalPoints: Int32?,
                   enabled: Bool = true)
  {
    self.init(context: context)
    self.nameRaw = name

    self.earnedPoints = earnedPoints ?? -1
    self.totalPoints = totalPoints ?? -1
    self.enabled = enabled

    self.creationDate = .now
    self.lastModifiedDate = .now
    self.uuidRaw = UUID()
    DatabaseStore.saveDatabase(context: context)
  }

  var name: String { self.nameRaw ?? "Nil assignment name" }
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

  var isValid: Bool {
    if enabled == false { return false }
    return earnedPoints >= 0 && totalPoints >= 0
  }

  var grade: Double {
    return Double(earnedPoints) / Double(totalPoints)
  }

  @ViewBuilder
  var listViewInfo: some View {
    if self.isValid == false {
      Image(systemName: "x.circle.fill")
        .tint(.red)
    } else {
      Text("\(Int(self.grade * 100))%")
    }
  }
}
