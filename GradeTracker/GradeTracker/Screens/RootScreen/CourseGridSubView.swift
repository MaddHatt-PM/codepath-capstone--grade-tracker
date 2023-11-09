//
//  CourseGridSubView.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/6/23.
//

import SwiftUI

struct CourseGridSubView: View {
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
      ForEach(0 ..< 5, id: \.self) { id in
        CurrentCourseGridCell(name: "\(id)")
      }
    }
  }
}

#Preview {
  CourseGridSubView()
}
