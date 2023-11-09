//
//  ContentView.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/5/23.
//

import CoreData
import SwiftUI

struct RootScreen: View {
  @Environment(\.managedObjectContext) private var viewContext
  @State private var isAddCourseSheetVisible = false

  var trailingToolbar: some View {
    return HStack {
      // Settings button
      NavigationLink {
        SettingsScreen()
      } label: { Image(systemName: "gearshape") }

      // Add Course Button
      Button { isAddCourseSheetVisible.toggle() } label: { Image(systemName: "plus.rectangle") }
    }
    .tint(.indigo)
  }

  var body: some View {
    NavigationStack {
      ScrollView(.vertical) {
        VStack(alignment: .leading) {
          CourseGridSubView()
          Spacer()
        }
        .sheet(isPresented: $isAddCourseSheetVisible) { AddCourseSheet() }
        .navigationTitle("Courses")
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) { trailingToolbar }
        }
      }
    }
  }
}

#Preview {
  RootScreen()
    .environment(\.managedObjectContext, DatabaseStore.preview.container.viewContext)
}
