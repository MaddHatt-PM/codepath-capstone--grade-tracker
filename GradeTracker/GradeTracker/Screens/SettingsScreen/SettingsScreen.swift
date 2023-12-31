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
    BaseScreen {
      VStack {
        Button {
          DatabaseStore().resetDatabase(context: context)
          print("Reset Database")
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
              print("Course \(course.name )")
              let assignmentsArray = Array(course.assignments as? Set<Assignment> ?? [])
              assignmentsArray.forEach { assignment in
                print("  Assignment \(assignment.name )")
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
}

#Preview {
  SettingsScreen()
}
