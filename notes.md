To-do's:

* Link teachers to students
    has_many :students, through: :programs
* Link videos to students
    has_many :students, through: :programs
* Link students to teachers
    has_many :teachers, through: :programs

* Down the line, depending on whether its needed or not, may link students to videos

Built models
Built tables and run migrations
Seed the database following the designed student and teacher flows.

Student flow:


Teacher flow: (write out two at a time, build out the routes, controllers and views, then come back for more:)

1. A teacher signs up for an account
    
2. Teacher gets taken to their show page where they will see an empty section
    for: 
        -programs 
        - videos that haven't yet been added to programs
        - and students.
    There will also be buttons in the navbar or elsewhere to create a new program and to upload videos

3. clicking on upload videos will take the teacher to a videos/new page
    where a teacher can upload several videos. For now let's have a fixed number of 3 videos. Later on will explore how to add inputs for additional video uploads on the same page. 

**--> What needs to be built for steps 1 and 2:

- Teachers controller with actions: new, create, and show * completed 
- view pages for new and show * completed
- routes:
    root "welcome#home" (welcome page for the website, link to teachers home from here) * completed
    get /teachers/home => "welcome#teachers" * completed
    get /teachers/new => "teachers#new" * completed
    post /teachers => "teachers#create" * completed
    get /teachers/:id => "teachers#show" * completed

**--> What needs to be built for step 3:

    - Videos controller
    - action for new and create

    - what params do you need in new to associate the video with the teacher?

    It looks like will need to build out a login system and make use of the method current user which depends on a user being logged in. 
    If you complete anything that'll be replicated, just make sure to go through with the replication. (for example, I built out the student model, controller, and views. at this point its all set up to set new students up.)

**--> For now lets polish up the teacher model. If I get the login system down and have it work for the teacher side of the website, implementing the remaining models and students can be replicated with some modifications of course.

    Add validations to Teacher.

    ---

    Working on wrapping up the teachers section of things:

    These are things that I should work on next:

    Draw out the current condition of the app and make sure that no one can do something theyre not supposed to do.
    It would be helpful to list out what each type of user is authorized to do. and then try to break it or test it.
    ex: have a student try to make a new video or program - have a teacher try to edit another teacher's program -
    have a teacher try to create a video under another teacher's name - have a teacher try to delete another teacher's video.
    
    Incorporate:

    1. Ability to edit and delete.
    2. Ability to edit and delete videos.
    3. Add links to all the pages so there's a flow.
    4. implement the scope method.
    4. distinguish between a teacher's homepage and their profile page. may need a new route here.
    5. Try to incorporate a form that will allow creation of videos from the ne program view. (nested forms, watch video).
    6. Incorporate the students side of things: ability to add programs to their library, ability to favorite a program, and perhaps the ability to "take" a class. this may require another join table.
    7. Implement oAuth with Instagram

---

Action list:

First sprint (30 min)

1. On programs index page add a conditional link:
    if a teacher is viewing the programs index, they should have a link that allows them to create a new program.
2. On the student profile page (show page) include links to view your library, which includes programs the student has added to their library 
3. On the programs index page, the name of the program should link to the program show page so that a student can then 
add the program to their library. During the process of a student adding a program to their library, should only add the program if the student hasn't already included it.
4. Add links to the student_programs index page. should link back to profile.
5. add link on student show page to logout
6. add link on student_teachers page to go back to profile page.
7. When a student views their teachers should have a list of unique names. 

Second sprint (30 min)

1. On the homepage, add link to create a new student
2. on homepage link to the teachers homepage
3. on teacher's homepage, add link to create a new teacher
4. Add login button on student homepage
5. Add login button on teacher homepage
6. Add edit features from program show page

Third sprint (30 min)
1. Add delete feature from program show page
2. Add edit feature from video show page
3. Add delete feature from video show page

To-dos:

- Implement scope method.
- Implement user submittable attribute in student_programs (favorited).
- Implement oAuth.
- Implment partials for views.
- refactor code to DRY up, reduce logic in controllers, use helpers for views to display conditional content, etc.
- implement devise in another branch, for signup, login, logout and oAuth.

First sprint (30 min):

- implement scope method for Program. The scope method could filter programs based on the current teacher or 
it could take in arguments, and pull up programs for any teacher passed in as the argument. 

Second sprint (30 min):
- Implement login via oauth and instagram
     
    






