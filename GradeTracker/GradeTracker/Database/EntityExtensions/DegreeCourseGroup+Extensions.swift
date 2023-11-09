//
//  DegreeCourseGroup+Extensions.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation

public extension DegreeCourseGroup {
  func create(context: NSManagedObjectContext,
              name: String,

              groupDescription: String = "",
              groupTypeID: Int32 = 0,
              minimumCoursesRequired: Int32 = -1,
              minimumCreditHoursRequired: Int32 = -1)
  {
    self.name = name

    self.groupDescription = groupDescription
    self.groupTypeID = groupTypeID
    self.minimumCoursesRequired = minimumCoursesRequired
    self.minimumCreditHoursRequired =
      minimumCreditHoursRequired

    self.creationDate = .now
    self.lastModifiedDate = .now
    self.uuid = UUID()
    DatabaseStore.saveDatabase(context: context)
  }

  func save(context: NSManagedObjectContext) {
    self.lastModifiedDate = .now
    DatabaseStore.saveDatabase(context: context)
  }

  var isComplete: Bool {
    // TODO: Flesh out later with groupTypeID
    return false
  }
}
