//
//  CourseAssignmentTab.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/11/23.
//

import SwiftUI

struct CourseAssignmentsTab: View {
  let course: Course

  @State private var isToggled = false
  @Environment(\.managedObjectContext) private var viewContext

  func delete(_ assignment: Assignment) {
    let name = assignment.name
    viewContext.delete(assignment)
    do {
      try viewContext.save()
    } catch {
      fatalError("Fatal error on deleting \(name) and saving.")
    }
  }

  var body: some View {
    let weightGroups: [WeightGroup] = course.weightGroupsForDisplay
    let totalRawWeight = course.totalRawWeight

    BaseScreen {
      ZStack {
        List {
          ForEach(weightGroups) { weightGroup in
            Section {
              ForEach(weightGroup.assignmentsArrayForDisplay, id: \.self) { assignment in
                NavigationLink(value: assignment) {
                  HStack {
                    Text(assignment.name)
                    Spacer()
                    assignment.listViewInfo
                  }
                }
                .swipeActions {
                  Button(role: .destructive) { delete(assignment) } label: { Text("Delete") }
                    .tint(.red)
                }
              }

            } header: {
              HStack {
                Text(weightGroup.name)
                Spacer()
                Text("\(String(format: "%.2f", weightGroup.weightRaw / totalRawWeight * 100))%")
              }
            }
          }

          Spacer()
            .listRowBackground(Color.clear)
            .frame(height: QuickAddButton.height)
        }
        .scrollContentBackground(.hidden)

        Color.black
          .opacity(isToggled ? 0.35 : 0.0)
          .onTapGesture {
            isToggled.toggle()
          }
          .animation(.linear(duration: 0.1), value: isToggled)

        QuickAddButton($isToggled)
      }
    }
  }
}

#Preview {
  do {
    let (context, course) = try GetCourseForPreviews()

    return NavigationStack {
      TabView {
        CourseAssignmentsTab(course: course)
          .tabItem { Label("Assignments", systemImage: "doc.text") }
      }
      .navigationTitle(course.name)
    }
    .environment(\.managedObjectContext, context)

  } catch {
    print("Unexpected error when retrieving Course: \(error).")
    return VStack {
      Text("An error occurred when retrieving Course.")
    }
  }
}

struct QuickAddButton: View {
  static let height: CGFloat = 24

  @Binding private var isToggled: Bool
  @State private var rotationDegree = 0.0

  internal init(_ isToggled: Binding<Bool>) {
    self._isToggled = isToggled
  }

  var body: some View {
    VStack {
      Spacer()
      HStack {
        Spacer()
        Button {
          isToggled.toggle()
          rotationDegree = isToggled ? 45.0 : 0.0
        } label: {
          Image(systemName: "plus")
            .resizable()
            .frame(width: QuickAddButton.height, height: QuickAddButton.height)
            .padding()
            .foregroundStyle(.white)
            .background(Color.indigo)
            .clipShape(Circle())
            .rotationEffect(.degrees(rotationDegree))
            .animation(.interpolatingSpring(stiffness: 720, damping: 15), value: rotationDegree)
            .padding(.trailing, 32)
            .padding(.bottom, 24)
        }
      }
    }
  }
}
