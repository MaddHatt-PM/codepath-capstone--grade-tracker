//
//  Degree+Extensions.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation

public extension Degree {
  func create(context: NSManagedObjectContext,
              name: String,
              
              degreeDescription: String = "",
              degreeStatusID: Int32 = 0,
              degreeType: String = "")
  {
    self.name = name
    
    self.degreeDescription = degreeDescription
    self.degreeStatusID = degreeStatusID
    self.degreeType = degreeType
    
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
