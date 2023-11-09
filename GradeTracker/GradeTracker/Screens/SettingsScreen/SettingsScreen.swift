//
//  SettingsScreen.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/6/23.
//

import CoreData
import SwiftUI

struct SettingsScreen: View {
  @Environment(\.managedObjectContext) private var context

  var body: some View {
    VStack {
      Button {
        DatabaseStore().resetDatabase(context: context)
      } label: {
        Text("Reset Database")
      }
      .buttonStyle(.borderedProminent)

      Button {
        DBGen().generateSampleDatabase(context: context)
        print("Added database")
      } label: {
        Text("Load Template Database")
      }
      .buttonStyle(.borderedProminent)

      Button {
        do {
          let fetchRequest: NSFetchRequest<Course>
          fetchRequest = Course.fetchRequest()
          let objects = try context.fetch(fetchRequest)
          objects.forEach { course in
            print("Course \(course.name ?? "Invalid")")
            let assignmentsArray = Array(course.assignments as? Set<Assignment> ?? [])
            assignmentsArray.forEach { assignment in
              print("  Assignment \(assignment.name ?? "Invalid")")
            }
          }
        } catch {
          print("Error occured")
        }
      } label: {
        Text("Print course names")
      }
    }
    .navigationTitle("Settings")
  }
}

#Preview {
  SettingsScreen()
}
