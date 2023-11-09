//
//  GenerateSampleDatabase.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation

public extension DBGen {
  func generateSampleDatabase(context: NSManagedObjectContext) {
    let courseAlgorithms = Course(context: context)
    courseAlgorithms.create(context: context, name: "Algorithms")

    courseAlgorithms.addToAssignments(Assignment(context: context).create(context: context, name: "Test 1", earnedPoints: 86, totalPoints: 100))
    courseAlgorithms.addToAssignments(Assignment(context: context).create(context: context, name: "Test 2", earnedPoints: 97, totalPoints: 100))
    courseAlgorithms.addToAssignments(Assignment(context: context).create(context: context, name: "Test 3", earnedPoints: 92, totalPoints: 100))
    courseAlgorithms.save(context: context)
  }
}
