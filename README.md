# Grade Tracker

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)
5. [Task Bank](#task-bank-separated-by-dependency)
6. [Project Progress](#project-progress)
    1. [Week 01](#week-01-progress)



## Overview
### Description
Grade Tracker is an app for students to get glanceable statistics of their courses and where best to devote their time and energy to improve their classes. With the minimum viable product (MVP) being that of data entry and display, additional features can be built to improve the user experience. 

### App Evaluation
__Mobile__: While there are websites to calculate weighted averages and required final grades, the info has to be re-entered if the website doesn't have caching or large amounts of the data has not changed. By having the software mobile, the user has a more accessible method of adding their grades in the moment.  
__Story__: This app would be very compelling for those who struggle with anxiety with not knowing their current grade or their required grade to make on their final for the course grade they desire.  
__Market__: The student demographic is quite large and there does not appear to be much of a marketplace for this type of app with good UI/UX.
__Habit__: The user would need to frequently enter in their assignment grades. Note: It may be possible to connect with an online platform, ie: Blackboard or Moodle, for less user input. 
__Scope__: The app would require knowledge on CoreData as opposed to UserDefaults as the data is interconnected together, ie: Semester > Course > Assignment. However, the way the data is laid out makes it easy to describe the UI hierarchy.

## Product Spec

### 1. User Stories (Required and Optional)
**Required Must-have Stories**
- User can add a new course.
- User can configure the details of a course.
- User can view all their courses.
- User can add a grade weight group to a course.
- User can add a new assignment with a grade weight to a course.
- User can configure the details of an assignment.
- User can view the progression of their grades via graphs.
- User can calculate what they need to make on their final for a desired course grade.
- User can view all assignments separated by weight for a course.
- User can mark courses as completed or as archived (dropped out).
    - Note: Archived shouldn't delete the course in case they want to refer to it later.
- User can select their default grade point scale.


**Optional Nice-to-have Stories**
- User can add attachments for later reference (ie: Syllabus).
- User can add the time they spent studying for a specific date.
- User can edit the time they spent studying for a specific date.
- User can view the progression of their time spent studying via graphs.
- User can add notes and descriptions to assignments.
- User can add general notes for misc purposes (IE: Who best to take for a course).
- User can filter out current and completed courses.
- Users can assign courses to a major to quickly create templates when they take future courses.
- User can select their icon and color for a course.

### 2. Screen Archetypes

- __Stream__
    - Required
        - User can view all assignments separated by weight for a course.
    - Optional
        - User can filter out current and completed courses.
        - User can view the progression of their time spent studying via graphs.
- __Detail__
    - Required
        - User can view all their courses.
        - User can configure the details of a course.
        - User can configure the details of an assignment.
        - User can calculate what they need to make on their final for a desired course grade.
    - Optional
        - User can select their icon and color for a course.
- __Creation__
    - Required
        - User can add a new course.
        - User can add a grade weight group to a course.
    - Optional
        - User can add attachments for later reference (ie: Syllabus).
        - User can add the time they spent studying for a specific date.
        - Users can assign courses to a major to quickly create templates when they take future courses.
        - User can add notes and descriptions to assignments.
        - User can add general notes for misc purposes (IE: Who best to take for a course).
- __Settings__
    - Required
        - User can select their default grade point scale.

### 3. Navigation

**Tab Navigation** (Tab to Screen)  
From a selected course:
- Assignments (Default)
- Graph View
- Notes
- Course Settings
- Time Tracking (Optional story)


**Flow Navigation** (Screen to Screen)

Main Screen:
- Course Screen (Push)
- App Settings (Push)
- Add Course (Popover)

Course Screen: Assignments Tab:
- Create + Edit Assignment 

Course Screen: Notes Tab:
- Create + Edit Notes

Course Screen: Time Tracking Tab (Optional story)
- Create + Edit Time Tracking

## Wireframes
![Navigation Wireframe](./doc-assets/navigation-wireframe.png)

## Schema 

[This section will be completed in Unit 9]

### Models

__Assignments__: A task assigned from a course with or without a grade.
| Attribute        | Type    | Details                 |
|------------------|---------|-------------------------|
| name             | String  | Default=""              |
| uuid             | UUID    | Optional                |
| creationDate     | Date    |                         |
| lastModifiedDate  | Date    |                         |
| enabled          | Boolean | Default=YES             |
| awardedPoints    | Double  | Optional                | ADD LATER
| totalPoints      | Double  | Optional, Default=100.0 | ADD LATER

| Relationship       | Destination        | Inverse            | Type               |
|--------------------|--------------------|--------------------|--------------------|
| notes              | Note               | assignment         | To One             |
| weightGroup        | WeightGroup        | assignments        | To One             |
| course             | Course             | assignments        | To One             |

__Course__: A collection of assignments
| Attribute         | Type      | Details              |
|-------------------|-----------|----------------------|
| name              | String    | Default=""           |
| uuid              | UUID      | Optional             |
| creationDate      | Date      |                      |
| lastModifiedDate   | Date      |                      |
| professor         | String    | Optional, Default="" |
| courseDescription | String    | Default=""           |
| courseIdentifier   | String    | Default=""           |
| courseStatus      | Integer32 | Default=0            |
| creditHours       | Integer32 | Default=0            |
| excludeFromGPA    | Boolean   | Default=NO           |
| iconID            | Integer32 | Default=0            |
| colorID           | Integer32 | Default=0            |

| Relationship      | Destination       | Inverse | Type    |
|-------------------|-------------------|---------|---------|
| degreeCourseGroup | DegreeCourseGroup | courses | To One  |
| notes             | Note              | course  | To Many |
| timeslots         | TimeSlot          | course  | To Many |
| weightGroups      | WeightGroup       | course  | To Many |
| assignments       | Assignments       | course  | To Many |

__Degree__: Collection of DegreeCourseGroups.  
| Attribute         | Type      | Details              |
|-------------------|-----------|----------------------|
| name              | String    | Default=""           |
| uuid              | UUID      | Optional             |
| creationDate      | Date      |                      |
| lastModifiedDate   | Date      |                      |
| degreeDescription | String    | Default=""           |
| degreeStatus      | Integer32 | Default=0            |
| degreeType        | String    | Default=""           |


| Relationship      | Destination       | Inverse | Type    |
|-------------------|-------------------|---------|---------|
| courseGroups      | DegreeCourseGroup | degree  | To One  |

__DegreeCourseGroup__: Collection of Courses with customizable constraints.  
| Attribute              | Type      | Details              |
|------------------------|-----------|----------------------|
| name                   | String    | Default=""           |
| uuid                   | UUID      | Optional             |
| creationDate           | Date      |                      |
| lastModifiedDate        | Date      |                      |
| groupDescription       | String    | Default=""           |
| groupType              | Integer32 | Default=0            |
| minimumCoursesRequired | Integer32 | Optional             |

| Relationship      | Destination       | Inverse           | Type    |
|-------------------|-------------------|-------------------|---------|
| courses           | Course            | degreeCourseGroup | To One  |
| degree            | Degree            | courseGroups      | To One  |

__Note__
| Attribute         | Type      | Details              |
|-------------------|-----------|----------------------|
| name              | String    | Default=""           |
| uuid              | UUID      | Optional             |
| creationDate      | Date      |                      |
| lastModifiedDate   | Date      |                      |
| content           | String    | Default=""           |

| Relationship      | Destination       | Inverse           | Type    |
|-------------------|-------------------|-------------------|---------|
| assignment        | Assignment        | notes             | To One  |
| attachments       | NoteAttachment    | note              | To Many |
| course            | Course            | notes             | To One  |
| tags              | NoteTag           | note              | To Many |

__NoteAttachment__
| Attribute         | Type       | Details              |
|-------------------|------------|----------------------|
| name              | String     | Default=""           |
| uuid              | UUID       | Optional             |
| binaryData        | BinaryData | Optional             |
| filename           | String     | Optional             |

| Relationship      | Destination       | Inverse           | Type    |
|-------------------|-------------------|-------------------|---------|
| note              | Note              | attachments       | To One  |

__NoteTag__
| Attribute         | Type      | Details              |
|-------------------|-----------|----------------------|
| name              | String     | Default=""          |
| uuid              | UUID       | Optional            |

| Relationship | Destination | Inverse     | Type    |
|--------------|-------------|-------------|---------|
| note         | Note        | tags        | To Many |

__TimeSlot__
| Attribute         | Type      | Details              |
|-------------------|-----------|----------------------|
| uuid              | UUID      | Optional             |
| startTime         | Date      |                      |
| endTime           | Date      |                      |
| days              | Integer32 | Default=0            |

| Relationship   | Destination | Inverse     | Type    |
|----------------|-------------|-------------|---------|
| course         | Course      | timeslots   | To One  |

__WeightGroup__
| Attribute         | Type      | Details              |
|-------------------|-----------|----------------------|
| name              | String    | Default=""           |
| uuid              | UUID      | Optional             |
| creationDate      | Date      |                      |
| lastModifiedDate   | Date      |                      |
| rawWeight         | Double    | Default=1.0          |


| Relationship   | Destination | Inverse      | Type    |
|----------------|-------------|--------------|---------|
| assignments    | Assignment  | weightGroup  | To Many |
| course         | Course      | weightGroups | To One  |

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]


## Task Bank (Separated by Dependency)
### Time Estimate Legend
[0] Less than 1 hour of work  
[1] 1-2 hours of work  
[2] 2-4 hours of work  
[4] 4-8 hours of work  
[8] More than 8 hours of work  

### Hard Required Features
✅ [1] Project setup  
✅ [1] Initial UI pass for course.
✅ [0] Initial UI pass to settings screen from NavBar element.  
✅ [0] Initial UI pass to create course from NavBar element (popover).  
✅ [4] CoreData models for courses, weight groups, assignments, and notes.  
✅ [4] Setup initializers and extension methods for all CoreData Entities
✅ [2] Prototype database generator  
[4] Initial UI pass for demo database.  
✅ [0] Verifying demo database is working via console.  
DONE [1] Added more data fields for DBGen.SimpleSample()

✅ [0] Settings button to reset database to empty.  
✅ [0] Settings button to reset database to prototype data.  
[2] Prototype data for SwiftUI Previews for course, weight groups, assignments, and notes.  
DONE [1] Figure out how to call save() on CoreData entity by static reference to Context.  
[1] Popover to edit all weight groups of a course.  
[1] Push to edit assignment.  
[1] Popover to create assignment.  
[1] ComputeWeightedAverage with course parameter.  
[2] Second pass at course:assignments tab.  
[2] Second pass at course:notes tab.  
[4] Initial pass at course:visualizer SwiftUI graphs.  

### Soft Required Features
[1] Normalize weight groups when total does not equal 100%.  
[2] Sort assignments by chronological plus weight group, best to worst, greatest influence, etc.  
[1] Selectable colors and icons for courses.  
[2] Customize Main Screen's course button color to course color and tile course icon.  
[2] Recolor course UI to assigned course color.  

### Optional Features
[2] Special animated transition from main screen to course screen.  
[0] When there are no current courses, show a graphic to create a new course.  
[2] Add StudyTime to database for courses and assignments.  

## Project Progress
### Week 01 Progress
__Sprint Tasks Completed__
[1] Project setup  
[4] CoreData models for courses, weight groups, assignments, and notes.  
[1] Initial UI pass for course.
[0] Initial UI pass to settings screen from NavBar element.  
[0] Initial UI pass to create course from NavBar element (popover).  
[4] Setup initializers and extension methods for all CoreData Entities.  
[2] Prototype database generator  
[0] Verifying demo database is working via console.  
[0] Settings button to reset database to empty.  
[0] Settings button to reset database to prototype data.  

__Video Walkthrough__
[Demo Video of Week One](https://youtube.com/shorts/2-TQ4_ISDyA?feature=share)

__Reflection__
For this week I felt like I made great progress with the foundation of the project, specifically with the database portion. While my mac development isn't accessible for me all the time due to commuting to my university, I made up for that time by research best practices for SwiftUI, CoreData, and general project organization. By default, CoreData entities do not have constructors and rely on setting individual values with a call to save via context. I bundled this process so that each entity has their own initializer function. My priority for this week was to have a blueprint for the UI navigation and for adding/querying the database and I feel that I achieved that. In the demo video, the settings screen has buttons to add, reset, and print out the database contents to console. Note that there is no output on the device as the UI would be removed shortly after implementation.  

For next week, I aim to solidify CRUD operations on my data. if possible I would like to start researching SwiftUI Graphs for the week afterwards. With my university schedule being slightly eased up, I hope to achieve these goals despite there being two large exams my friday morning.