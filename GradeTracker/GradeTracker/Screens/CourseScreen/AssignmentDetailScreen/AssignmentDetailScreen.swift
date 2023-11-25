//
//  AssignmentDetailScreen.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/17/23.
//

import SwiftUI

struct AssignmentDetailScreen: View {
  var assignment: Assignment
  var body: some View {
    BaseScreen {
      ScrollView {
        VStack {
          HStack {
            Text("Earned Points / Total Points: \(assignment.earnedPoints)/\(assignment.totalPoints)")
            Spacer()
          }
          HStack {
            Text("Creation Date: \(assignment.creationDate!)")
            Spacer()
          }
          HStack {
            Text("Last Modified Date: \(assignment.lastModifiedDate!)")
            Spacer()
          }
          HStack {
            Text("Enabled: \(String(assignment.enabled))")
            Spacer()
          }
        }.padding()
      }
    }
    .navigationTitle(assignment.name)
  }
}

// #Preview {
//  AssignmentDetailScreen()
// }
