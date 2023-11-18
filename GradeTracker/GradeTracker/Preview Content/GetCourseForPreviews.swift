//
//  GetCourseForPreviews.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/11/23.
//

import CoreData
import Foundation

enum CoreDataPreviewErros: Error {
  case unknownError
}

func GetCourseForPreviews() throws -> (NSManagedObjectContext, Course) {
  let dataStore = DatabaseStore.shared
  let fetchRequest = NSFetchRequest<Course>(entityName: "Course")
  let context = dataStore.container.viewContext

  let courses = try context.fetch(fetchRequest)
  if courses.count == 0 {
    DBGen().generateSampleDatabase(context: context)
  }
  if let course = courses.first {
    return (context, course)
  } else {
    throw CoreDataPreviewErros.unknownError
  }
}
