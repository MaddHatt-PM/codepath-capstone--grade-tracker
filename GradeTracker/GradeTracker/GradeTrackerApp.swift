//
//  GradeTrackerApp.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/5/23.
//

import SwiftUI

@main
struct GradeTrackerApp: App {
    let persistenceController = DatabaseManager.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
