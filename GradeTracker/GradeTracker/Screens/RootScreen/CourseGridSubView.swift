//
//  CourseGridSubView.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/6/23.
//

import SwiftUI

struct CourseGridSubView: View {
  @Environment(\.managedObjectContext) private var viewContext

  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Course.nameRaw, ascending: true)],
    animation: .default)
  private var courses: FetchedResults<Course>

  func deleteCourse(course: Course) {
    let name = course.name
    viewContext.delete(course)

    do {
      try viewContext.save()
    } catch {
      fatalError("Failed to delete \(name) and then save")
    }
  }

  var body: some View {
    let gap = StylingConstants.gridGap
    let halfScreenWidth: CGFloat = UIScreen.main.bounds.width / 2 - gap
    let columns = [
      GridItem(.fixed(halfScreenWidth - gap / 2), spacing: gap / 2),
      GridItem(.fixed(halfScreenWidth - gap / 2), spacing: gap / 2),
    ]

    LazyVGrid(columns: columns,
              alignment: .center,
              spacing: gap / 2) {
      ForEach(courses) { course in
        CurrentCourseGridCell(name: course.name, course: course)
          .contextMenu(menuItems: {
            ForEach(course.weightGroupsForDisplay) { weightGroup in
              Button {
                print("\(weightGroup.name) was clicked")
              } label: {
                Text("Add \(weightGroup.name) Grade")
              }
            }
            Divider()

            Button { print("Note was clicked") } label: { Label("Add new note", systemImage: "note.text") }
            Button { print("Photo was clicked") } label: { Label("Add new photo", systemImage: "camera") }
            Divider()

            Button(role: .destructive) { deleteCourse(course: course) } label: { Label("Delete course", systemImage: "trash") }

          })
      }
    }
  }
}

#Preview {
  CourseGridSubView()
}
