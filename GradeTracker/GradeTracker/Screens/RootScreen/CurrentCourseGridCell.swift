//
//  CurrentCourseGridCell.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/6/23.
//

import SwiftUI

struct CurrentCourseGridCell: View {
  var name: String
  var course: Course

  var body: some View {
    NavigationLink(value: course) {
      ZStack {
        Rectangle()
          .fill(.indigo.gradient)
          .allowsHitTesting(false)
        VStack {
          Text(name)
            .padding()
        }
      }
    }
    .aspectRatio(1.5, contentMode: .fill)
    .clipShape(RoundedRectangle(cornerRadius: StylingConstants.gridCellCornerRadius))
  }
}

// #Preview {
//  CurrentCourseGridCell()
// }
