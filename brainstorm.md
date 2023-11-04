
# Brainstorming Lab Session
Notice: The rubric and activity guidelines had conflicting requirements so the rubric was used as it contained more items than the activities.

## 1. Initial Brainstorming Ideas
1. Car Journal
    - Category: Transportation
    - Features:
        - Scan your VIN for quick adding of your cars details via DOT API.
        - Keep track of the mileage of travels via Apple Maps API (free for iOS apps).  
        - Get notifications for recall notices via CarMD (paid API).
    - Development Challenges:
        - Large reliance on APIs.
        - Would need to learn notification servers or local notification system.
2. Fractal Viewer
    - Category: Entertainment
    - Features:
        - Explore fractal equations with a large precision of scale.
        - Generate daily fractal patterns for pretty widgets.
    - Development Challenges:
        - Would need to program graphical shaders.
        - More math knowledge.
3. Grade Tracker
    - Category: Education
    - Features:
        - Easily add in your grades for assignments.
        - Get glanceable info about weighted course totals
        - Calculate your needed grade for specific grade weights.
    - Development Challenges:
        - How to present info that requires technical precision in a pleasant format. 
4. Pomodoro Garden
    - Features:
        - Combination of typical Pomodoro apps with the Forest app.
            - Note: Forest App: Grow a forest by keeping the app open to avoid distraction.
    - Development Challenges
        - Heavy art focus for a pleasant personality that would require a lot of custom UI.
5. Group Planner
    - Category: iMessage App
    - Features:
        - Allow the submitter to create a range of time slots where they're available.
        - Submit iMessage polls in group chats.
        - Have everyone submit ideas for what to do and have a random one come out.
    - Development Challenges:
        - Broadly unsure about the scopes of iMessage app developments.
        - Would require other users in the chat to have the app installed.
6. Budget Tracker
    - Category: Finance
    - Features:
        - Organize expenses into different groups and allocate different percentages for each.
        - Showcase the user's expenses via SwiftUI Charts
    - Development Challenges:
        - The app would need to be sufficiently handy to beat out competitors and have the user keep coming back.

---

## 2. Evaluating Ideas
Questions to answer for the top 3 ideas:
- __Mobile__: How uniquely mobile is the product experience?
- __Story__: How compelling is the story around this app once completed?
- __Market__: How large or unique is the market for this app?
- __Habit__: How habit-forming or unique is the market for this app?
- __Scope__: How well-formed is the score for this app?

### 1. Car Journal
- __Mobile__: While the data is accessible for a website, the data collection of travels is unique for mobile devices.  
- __Story__: The app is designed for those who wish to be more knowledgeable about their car but lack the time to invest.
- __Market__: As the car industry plays a predominate role in US society, the potential market is quite high. Note: This may be less marketable in non-US countries. This app would also be beneficial for those needing to track their mileage and maintenance appointment with respect to their cars total mileage.
- __Habit__: The user would need to access the app about once a week or so to reconfirm mileage and trip info. The user would also need to enter in their maintenance details when needed.
- __Scope__: Due to the multiple APIs required for the app to be sufficiently habit-forming, the app may be difficult to create.

### 2. Grade Tracker
- __Mobile__: While there are websites to calculate weighted averages and required final grades, the info has to be re-entered if the website doesn't have caching or large amounts of the data has not changed. By having the software mobile, the user has a more accessible method of adding their grades in the moment.  
- __Story__: This app would be very compelling for those who struggle with anxiety with not knowing their current grade or their required grade to make on their final for the course grade they desire.  
- __Market__: The student demographic is quite large and there does not appear to be much of a marketplace for this type of app with good UI/UX.
- __Habit__: The user would need to frequently enter in their assignment grades. Note: It may be possible to connect with an online platform, ie: Blackboard or Moodle, for less user input. 
- __Scope__: The app would require knowledge on CoreData as opposed to UserDefaults as the data is interconnected together, ie: Semester > Course > Assignment. However, the way the data is laid out makes it easy to describe the UI hierarchy.

### 3. Pomodoro Garden
- __Mobile__: While the app leans more as a website, the inability to use your phone for distraction is a feature in and of itself.  
- __Story__: Unfortunately this app already exists as two separate apps, the pomodoro apps and the specific app Forest. It may also be likely that this app already exists.  
- __Market__: The market for this app may be slightly limiting as it is restricted to those that are easily distracted by a phone and seeking a solution that is not "just putting up the phone".  
- __Habit__: The app's level of habit-forming would rely on increasing gains of satisfaction as the garden grows with more time spent with the app.  
- __Scope__: While the app isn't demanding in a technical sense, the art would need to play a large role in the success of the app.  

## Final Selection
Judging by my evaluations of my final 3 ideas, I will be picking my __Grade Tracker__ app due to the ease of the initial research and development and the potential to add more complex features later.