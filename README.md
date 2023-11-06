# Grade Tracker

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

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

__Assignments__
| Attribute        | Type    | Details     |
|------------------|---------|-------------|
| creationDate     | Date    |             |
| lastModifiedDate  | Date    |             |
| enabled          | Boolean | Default=YES |
| name             | String  | Default=""  |
| uuid             | UUID    | Optional    |

| Relationship       | Destination        | Inverse            | Type               |
|--------------------|--------------------|--------------------|--------------------|
| notes              | Note               | assignment         | To One             |
| weightGroup        | WeightGroup        | assignments        | To One             |

__Course__
| Attribute         | Type      | Details              |
|-------------------|-----------|----------------------|
| courseDescription | String    | Default=""           |
| courseIdentified   | String    | Default=""           |
| courseStatus      | Integer32 | Default=0            |
| creationDate      | Date      |                      |
| creditHours       | Integer32 | Default=0            |
| excludeFromGPA    | Boolean   | Default=NO           |
| iconID            | Integer32 | Default=0            |
| colorID           | Integer32 | Default=0            |
| lastModifiedDate   | Date      |                      |
| name              | String    | Default=""           |
| professor         | String    | Optional, Default="" |
| uuid              | UUID      | Optional             |

| Relationship      | Destination       | Inverse | Type    |
|-------------------|-------------------|---------|---------|
| degreeCourseGroup | DegreeCourseGroup | courses | To One  |
| notes             | Note              | course  | To Many |
| timeslots         | TimeSlot          | course  | To Many |
| weightGroups      | WeightGroup       | course  | To Many |


### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]