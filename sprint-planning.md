## Time Estimate Legend
[0] Less than 1 hour of work  
[1] 1-2 hours of work  
[2] 2-4 hours of work  
[4] 4-8 hours of work  
[8] More than 8 hours of work  

## Task Bank (Separated by Dependency)
### Hard Required Features
[1] Project setup  
[1] Initial UI pass for course.
[0] Initial UI pass to settings screen from NavBar element.  
[0] Initial UI pass to create course from NavBar element (popover).  
[2] Prototype database generator  
[4] CoreData models for courses, weight groups, assignments, and notes.  
[4] Initial UI pass for demo database.  


[0] Settings button to reset database to empty  
[0] Settings button to reset database to prototype data  
[2] Prototype data for SwiftUI Previews for course, weight groups, assignments, and notes.  
[1] Figure out how to call save() on CoreData entity by static reference to Context.  
$\quad$ Ref: https://stackoverflow.com/questions/56453857/how-to-save-existing-objects-to-core-data  
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