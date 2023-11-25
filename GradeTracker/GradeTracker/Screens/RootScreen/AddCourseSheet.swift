//
//  AddCourseSheet.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/6/23.
//

import SwiftUI

struct AddCourseSheet: View {
  private enum Field: Int, Hashable {
    case courseName
    case courseIdentifier
    case professor
    case description
  }

  @State private var courseName: String = ""
  @State private var courseIdentifier: String = ""
  @State private var colorID: Int = 0
  @State private var iconID: Int = 0
  @State private var professor: String = ""
  @State private var creditHours: Int = 3
  @State private var includeInGPA: Bool = true
  @State private var description: String = ""
  @FocusState private var focusedField: Field?

  @Environment(\.managedObjectContext) private var viewContext
  @Environment(\.dismiss) private var dismiss

  let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .none
    return formatter
  }()

  func processFocusChange() {
    let currentFocus = focusedField?.rawValue ?? 0
    focusedField = Field(rawValue: currentFocus + 1)
  }

  func onCreate() {
    let course = Course(viewContext,
                        name: courseName,
                        professor: professor,
                        courseDescription: description,
                        courseIdentifier: courseIdentifier,
                        creditHours: Int32(creditHours),
                        excludeFromGPA: !includeInGPA,
                        colorID: Int32(colorID),
                        iconID: Int32(iconID))
    dismiss()
  }

  var body: some View {
    BaseScreen {
      VStack(spacing: 0) {
        AddSheetHeader(title: "Add Course", showCancelButton: courseName != "")
        Form {
          Section("Course info") {
            TextField("Course Name", text: $courseName)
              .focused($focusedField, equals: .courseName)
              .interactiveDismissDisabled(courseName != "")
              .onAppear { DispatchQueue.main.async { focusedField = .courseName } }

            TextField("Course Identifier (HUM123)", text: $courseIdentifier)
              .focused($focusedField, equals: .courseIdentifier)

            TextField("Professor", text: $professor)
              .focused($focusedField, equals: .professor)

            Picker("Credit hours", selection: $creditHours) {
              ForEach(0 ... 5, id: \.self) {
                Text("\($0)")
              }
            }
            .pickerStyle(.automatic)

            Toggle(isOn: $includeInGPA) { Text("Include in GPA") }
              .tint(.green)
          }

          Section("Class times") {}

          Section("Course description") {
            TextField("Course description", text: $description, axis: .vertical)
              .lineLimit(8)
              .textFieldStyle(LongEntryTextFieldStyle())
              .focused($focusedField, equals: .description)
          }

          Section {
            Button { onCreate() } label: {
              HStack {
                Spacer()
                Text("Create course")
                Spacer()
              }
            }
            .disabled(courseName == "")
            .tint(.white)
          }
        }
        .onSubmit { processFocusChange() }
      }
      .padding(.bottom, 16)
      .ignoresSafeArea()
    }
  }
}

#Preview {
  VStack {
    Text("Hello world")
  }
  .sheet(isPresented: .constant(true), content: {
    AddCourseSheet()
  })
}

struct AddSheetHeader: View {
  var title: String
  var showCancelButton: Bool

  @Environment(\.dismiss) private var dismiss

  var body: some View {
    Rectangle()
      .fill(Color.indigo)
      .overlay {
        ZStack {
          VStack {
            Capsule()
              .fill(Color.secondary)
              .frame(width: 40, height: 4)
              .padding(10)
              .animation(.linear(duration: 0.25), value: showCancelButton)
              .opacity(showCancelButton ? 0.0 : 1.0)

            Spacer()
          }

          VStack {
            Spacer()
            HStack {
              Text(title)
                .font(.title)
                .bold()
              Spacer()
              Button { dismiss() } label: {
                Image(systemName: "xmark.circle.fill")
                  .resizable()
                  .frame(width: 24, height: 24)
              }
              .animation(.linear(duration: 0.25), value: showCancelButton)
              .opacity(showCancelButton ? 1.0 : 0.0)
            }
            .padding()
          }
        }
      }
      .frame(height: 66)
  }
}
