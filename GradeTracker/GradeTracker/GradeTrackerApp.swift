//
//  GradeTrackerApp.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/5/23.
//

import SwiftUI

@main
struct GradeTrackerApp: App {
  let persistenceController = DatabaseStore.shared

  var body: some Scene {
    WindowGroup {
      RootScreen()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
}
