//
//  GenerateSampleDatabase.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/8/23.
//

import CoreData
import Foundation

public extension DBGen {
  fileprivate func CreateCourseAlgorithms(_ context: NSManagedObjectContext) {
    let course = Course(context: context)
    course.create(context: context, name: "Algorithms", professor: "Dr. Whitley", creditHours: 3)
    
    let attendance = WeightGroup(context: context)
    attendance.create(context, name: "Attendance", rawWeight: 0.1)
    attendance.addToAssignments(assignments: [
      Assignment(context: context).create(context, name: "Attendance", earnedPoints: 94, totalPoints: 100),
    ])
    course.addToWeightGroups(attendance)
    
    let homework = WeightGroup(context: context)
    homework.create(context, name: "Homework", rawWeight: 0.25)
    homework.addToAssignments(assignments: [
      Assignment(context: context).create(context, name: "Recursion", earnedPoints: 94, totalPoints: 100),
      Assignment(context: context).create(context, name: "Heap", earnedPoints: 100, totalPoints: 100),
      Assignment(context: context).create(context, name: "QuickSort", earnedPoints: 88, totalPoints: 100),
      Assignment(context: context).create(context, name: "RAM Sort Select", earnedPoints: 100, totalPoints: 100),
      Assignment(context: context).create(context, name: "Hashing", earnedPoints: nil, totalPoints: 100),
      Assignment(context: context).create(context, name: "Order Stat Tree", earnedPoints: 95, totalPoints: 100),
      Assignment(context: context).create(context, name: "BFS DFS", earnedPoints: 84, totalPoints: 100),
    ])
    course.addToWeightGroups(homework)
    
    let examsGroup = WeightGroup(context: context)
    examsGroup.create(context, name: "Exams", rawWeight: 0.45)
    examsGroup.addToAssignments(assignments: [
      Assignment(context: context).create(context, name: "Test 1", earnedPoints: 86, totalPoints: 100),
      Assignment(context: context).create(context, name: "Test 2", earnedPoints: 97, totalPoints: 100),
      Assignment(context: context).create(context, name: "Test 3", earnedPoints: 92, totalPoints: 100),
    ])
    course.addToWeightGroups(examsGroup)
    
    course.save(context: context)
  }
  
  fileprivate func CreateCourseProgrammingCompetitions(_ context: NSManagedObjectContext) {
    let course = Course(context: context)
    course.create(context: context, name: "ST: Cybersecurity & Competitive Programming", professor: "Prof. Sarris", creditHours: 2)
    
    let participation = WeightGroup(context: context)
    participation.create(context, name: "Participation", rawWeight: 0.5)
    participation.addToAssignments(Assignment(context: context).create(context, name: "Attendance", earnedPoints: 100, totalPoints: 100))
    course.addToWeightGroups(participation)
    
    let journals = WeightGroup(context: context)
    journals.create(context, name: "Journals", rawWeight: 0.4)
    journals.addToAssignments(assignments: [
      Assignment(context: context).create(context, name: "Team Proposal Documentation", earnedPoints: 100, totalPoints: 100),
      Assignment(context: context).create(context, name: "Individual progress report 09/05", earnedPoints: 100, totalPoints: 100),
      Assignment(context: context).create(context, name: "Team status report 09/05", earnedPoints: 100, totalPoints: 100),
      Assignment(context: context).create(context, name: "Individual progress report 09/11", earnedPoints: 100, totalPoints: 100),
      Assignment(context: context).create(context, name: "Team status report 09/11", earnedPoints: 100, totalPoints: 100),
      Assignment(context: context).create(context, name: "Individual progress report 09/18", earnedPoints: 100, totalPoints: 100),
      Assignment(context: context).create(context, name: "Team status report 09/18", earnedPoints: 100, totalPoints: 100),
      Assignment(context: context).create(context, name: "Individual progress report 09/25", earnedPoints: 100, totalPoints: 100),
      Assignment(context: context).create(context, name: "Team status report 09/25", earnedPoints: 100, totalPoints: 100),
      Assignment(context: context).create(context, name: "Individual progress report 10/02", earnedPoints: 100, totalPoints: 100),
      Assignment(context: context).create(context, name: "Team status report 10/02", earnedPoints: 100, totalPoints: 100),
      Assignment(context: context).create(context, name: "Individual progress report 10/11 (Optional)", earnedPoints: 0, totalPoints: 100, enabled: false),
      Assignment(context: context).create(context, name: "Team status report 10/11 (Optional)", earnedPoints: 0, totalPoints: 100, enabled: false),
    ])
    course.addToWeightGroups(journals)
    
    let discussion = WeightGroup(context: context)
    discussion.create(context, name: "Discussions", rawWeight: 0.1)
    discussion.addToAssignments(Assignment(context: context).create(context, name: "In class discussions", earnedPoints: 100, totalPoints: 100))
    course.addToWeightGroups(discussion)
  }
  
  fileprivate func CreateCourseLinearAlgebra(_ context: NSManagedObjectContext) {
    let course = Course(context: context)
    course.create(context: context, name: "Linear Algebra I", professor: "Dr. Peifer", creditHours: 3)
    
    let total = WeightGroup(context: context)
    total.create(context, name: "All points", rawWeight: 1.0)
    total.addToAssignments(assignments: [
      Assignment(context: context).create(context, name: "Quiz 1: Vectors I", earnedPoints: 13, totalPoints: 15),
      Assignment(context: context).create(context, name: "Quiz 2: Vectors II", earnedPoints: 11, totalPoints: 15),
      Assignment(context: context).create(context, name: "Exam 1", earnedPoints: 77, totalPoints: 100),
      Assignment(context: context).create(context, name: "Quiz 3: Basic Matrices", earnedPoints: 13, totalPoints: 15),
      Assignment(context: context).create(context, name: "Quiz 4: Vector Spaces", earnedPoints: 12, totalPoints: 15),
      Assignment(context: context).create(context, name: "Exam 2", earnedPoints: 84, totalPoints: 100),
      Assignment(context: context).create(context, name: "Quiz 5: Cross Products & Determinates", earnedPoints: 7, totalPoints: 15),
      Assignment(context: context).create(context, name: "Quiz 6: Diagonalization", earnedPoints: nil, totalPoints: 15),
    ])
    course.addToWeightGroups(total)
  }
  
  func generateSampleDatabase(context: NSManagedObjectContext) {
    CreateCourseAlgorithms(context)
    CreateCourseProgrammingCompetitions(context)
    CreateCourseLinearAlgebra(context)
  }
}
