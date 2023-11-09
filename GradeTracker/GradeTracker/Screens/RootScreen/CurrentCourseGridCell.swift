//
//  CurrentCourseGridCell.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/6/23.
//

import SwiftUI

struct CurrentCourseGridCell: View {
  var name: String
//  var course: Course
//  var cellHeight: CGFloat

  var body: some View {
    ZStack {
      NavigationLink { CourseMainScreen() } label: { Rectangle().fill(.clear) }
      Rectangle()
        .fill(.indigo)
        .allowsHitTesting(false)
      VStack {
        Text ("Course \(name)")
      }
    }
    .aspectRatio(1.5, contentMode: .fill)
    .clipShape(RoundedRectangle(cornerRadius: StylingConstants.gridCellCornerRadius))
  }
}

// #Preview {
//  CurrentCourseGridCell()
// }
