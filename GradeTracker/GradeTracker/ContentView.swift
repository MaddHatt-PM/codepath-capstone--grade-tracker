//
//  ContentView.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/5/23.
//

import CoreData
import SwiftUI

struct ContentView: View {
  @Environment(\.managedObjectContext) private var viewContext

  var body: some View {
    NavigationStack {}
  }
}

#Preview {
  ContentView()
    .environment(\.managedObjectContext, DatabaseManager.preview.container.viewContext)
}
