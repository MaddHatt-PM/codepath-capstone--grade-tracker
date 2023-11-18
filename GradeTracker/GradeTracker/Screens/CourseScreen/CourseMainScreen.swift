//
//  CourseMainScreen.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/6/23.
//

import CoreData
import SwiftUI

struct CourseMainScreen: View {
  let course: Course
  let courseColor: Color = .cyan

  init(course: Course) {
    self.course = course

    let tabBarAppearance = UITabBarAppearance()
    tabBarAppearance.configureWithOpaqueBackground()
    tabBarAppearance.backgroundColor = UIColor(Color("TabBarBackground"))
    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
  }

  var body: some View {
    TabView {
      Group {
        CourseAssignmentsTab(course: course)
          .tabItem { Label("Assignments", systemImage: "doc.text") }

        VStack(content: {
          Text("Graphs")
        })
        .tabItem { Label("Graphs", systemImage: "chart.line.uptrend.xyaxis") }

        VStack(content: {
          Text("Notes")
        })
        .tabItem { Label("Notes", systemImage: "note.text") }

        VStack(content: {
          Text("General Info")
        })
        .tabItem { Label("Course Info", systemImage: "info.circle") }
      }
    }
    .tint(.indigo)
    .navigationTitle(course.name + " \(String(format: "%.2f", course.weightedAverage * 100))%")
    .toolbarBackground(.indigo, for: .navigationBar)
    .toolbarBackground(.visible, for: .navigationBar)
  }
}

#Preview {
  do {
    let (context, course) = try GetCourseForPreviews()

    return NavigationStack {
      CourseMainScreen(course: course)
    }
    .environment(\.managedObjectContext, context)

  } catch {
    print("Unexpected error when retrieving Course: \(error).")
    return VStack {
      Text("An error occurred when retrieving Course.")
    }
  }
}
