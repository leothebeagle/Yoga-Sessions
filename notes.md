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

What needs to be built for steps 1 and 2:

- Teachers controller with actions: new, create, and show
- view pages for new and show


