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
              }
            } header: {
              HStack {
                Text(weightGroup.name)
                Spacer()
                Text("\(String(format: "%.2f", weightGroup.weightRaw / totalRawWeight * 100))%")
              }
            }
          }
        }
        .scrollContentBackground(.hidden)

        Color.black
          .opacity(isToggled ? 0.2 : 0.0)
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
            .frame(width: 24, height: 24)
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
