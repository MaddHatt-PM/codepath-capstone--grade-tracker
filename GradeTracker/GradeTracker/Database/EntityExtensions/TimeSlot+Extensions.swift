//
//  TimeSlot+Extensions.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation

public extension TimeSlot {
  func create(context: NSManagedObjectContext,
              days: Int32,
              startTime: Date,
              endTime: Date)
  {
    self.days = days
    self.startTime = startTime
    self.endTime = endTime

    self.creationDate = .now
    self.lastModifiedDate = .now
    self.uuid = UUID()
    DatabaseStore.saveDatabase(context: context)
  }

  func save(context: NSManagedObjectContext) {
    self.lastModifiedDate = .now
    DatabaseStore.saveDatabase(context: context)
  }
}
