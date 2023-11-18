//
//  DegreeCourseGroup+Extensions.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation

public extension DegreeCourseGroup {
  convenience init(_ context: NSManagedObjectContext,
                   name: String,

                   groupDescription: String = "",
                   groupTypeID: Int32 = 0,
                   minimumCoursesRequired: Int32 = -1,
                   minimumCreditHoursRequired: Int32 = -1)
  {
    self.init(context: context)
    self.nameRaw = name

    self.groupDescriptionRaw = groupDescription
    self.groupTypeID = groupTypeID
    self.minimumCoursesRequired = minimumCoursesRequired
    self.minimumCreditHoursRequired = minimumCreditHoursRequired

    self.creationDate = .now
    self.lastModifiedDate = .now
    self.uuidRaw = UUID()
    DatabaseStore.saveDatabase(context: context)
  }

  var name: String { self.nameRaw ?? "Nil degree-course-group name" }
  var groupDescription: String { self.groupDescriptionRaw ?? "Nil degree-course-group description" }
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

  var isComplete: Bool {
    // TODO: Flesh out later with groupTypeID
    return false
  }
}
