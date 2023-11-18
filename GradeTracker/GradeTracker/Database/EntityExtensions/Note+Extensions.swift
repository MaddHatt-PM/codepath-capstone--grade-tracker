//
//  Note+Extensions.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation

public extension Note {
  convenience init(_ context: NSManagedObjectContext) {
    self.init(context: context)
    self.creationDate = .now
    self.lastModifiedDate = .now
    self.uuidRaw = UUID()
    DatabaseStore.saveDatabase(context: context)
  }

  var name: String { self.nameRaw ?? "Nil note name" }
  var content: String { self.contentRaw ?? "Nil note content" }
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
}
