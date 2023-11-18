//
//  TimeSlot+Extensions.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation

public extension TimeSlot {
  convenience init(_ context: NSManagedObjectContext,
                   days: Int32,
                   startTime: Date,
                   endTime: Date)
  {
    self.init(context: context)
    self.days = days
    self.startTime = startTime
    self.endTime = endTime

    self.creationDate = .now
    self.lastModifiedDate = .now
    self.uuidRaw = UUID()
    DatabaseStore.saveDatabase(context: context)
  }

  var uuid: UUID {
    guard let uuidRaw = uuidRaw else {
      print("UUIDRaw was unexpectedly nil, regenerating for TimeSlot for \(self.course?.name ?? "nil-course")")
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
}
