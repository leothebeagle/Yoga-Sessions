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
    If you complete anything that'll be replicated, just make sure to go through with the replication. 

**--> For now lets polish up the teacher model. If I get the login system down and have it work for the teacher side of the website, implementing the remaining models and students can be replicated with some modifications of course.

    Add validations to Teacher.






