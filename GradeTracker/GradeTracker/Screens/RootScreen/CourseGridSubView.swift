//
//  CourseGridSubView.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/6/23.
//

import SwiftUI

struct CourseGridSubView: View {
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Course.nameRaw, ascending: true)],
    animation: .default)
  private var courses: FetchedResults<Course>

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
      }
    }
  }
}

#Preview {
  CourseGridSubView()
}
