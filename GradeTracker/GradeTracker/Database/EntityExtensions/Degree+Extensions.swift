//
//  Degree+Extensions.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation

public extension Degree {
  convenience init(_ context: NSManagedObjectContext,
                   name: String,
                   
                   degreeDescription: String = "",
                   degreeStatusID: Int32 = 0,
                   degreeType: String = "")
  {
    self.init(context: context)
    self.nameRaw = name
    
    self.degreeDescriptionRaw = degreeDescription
    self.degreeStatusID = degreeStatusID
    self.degreeTypeRaw = degreeType
    
    self.creationDate = .now
    self.lastModifiedDate = .now
    self.uuidRaw = UUID()
    DatabaseStore.saveDatabase(context: context)
  }
  
  var name: String { self.nameRaw ?? "Nil degree name" }
  var degreeDescription: String { self.degreeDescriptionRaw ?? "Nil degree description" }
  var degreeType: String { self.degreeTypeRaw ?? "Nil degree type" }
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
