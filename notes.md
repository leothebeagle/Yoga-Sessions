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
     
    
to-do's:

- [x] Implement ability for a student to add programs to their library.
- [x] Implement the user submittable attribute.
- [x] Implement scope method.
- [x] Implement authorization in controllers using devise. 
- [x] Implement oauth using devise and instagram.
- [x] Add links to link up all the pages.
- [x] Use partials in your views.
- [x] Fix up the favoriting mechanism.
- Refactor.
- Implement bootstrap to style everything.

to-do's:

- Have a navbar that is dynamic, that changes according to whether or not a user is a student
or a teacher. And also, depending on whether or not a user is logged in. 
(don't want login link to show if a user is logged in. Also, change it up for teachers. Also, if youre logged out
dont display the logout button)
- style the flash notes
- Also, when a student is viewing the program show page, the links should be dynamic:
ex: if the program is already in the student's library, do not include the link "add program to library"
same goes for favoriting a program. if its favorited, then don't display the button

Possible way to deal with layouts:

The nav bar and layout will be slightly different for student and teacher
- most noticeable difference will be:
- the different logout paths
- The programs drop down in students will have: 'my library' and 'all programs'
- vs. the programs dropdown for teachers will have 'create program' and 'all programs'
- will need to deal with displaying conditional links so will most likely need helper methods for 
each type of view (this will pop into a specific layout via yield) ex: program show links, teacher show links, program index links (incl. the ones nested under teachers)

A useful resource for customizing devise login forms using bootstrap:

https://stackoverflow.com/questions/29835455/devise-login-with-bootstrap-in-rails





to-do's

for teacher:

need to add in links to create, edit and delete programs
need to add in links to create, edit and delete videos

fix sing in via instagram. problem with getting nil back with student.favorite programs => the show page isnt rendering because it 
cant execute a mehtod on nil.


The return value is different when you query a model using where, or find_by or find

where:

[#<LibraryItem:0x007fe868724a90
  id: 14,
  student_id: 1,
  program_id: 7,
  favorited: true,
  created_at: Sat, 17 Aug 2019 14:24:48 UTC +00:00,
  updated_at: Sat, 17 Aug 2019 14:35:12 UTC +00:00>]

  gives you the record in array format

  find_by:

  #<LibraryItem:0x007fe86f131a50
 id: 14,
 student_id: 1,
 program_id: 7,
 favorited: true,
 created_at: Sat, 17 Aug 2019 14:24:48 UTC +00:00,
 updated_at: Sat, 17 Aug 2019 14:35:12 UTC +00:00>

 returns individual objects only


 Teacher delete and edit links:
<input name="program_id" type="hidden" id="program_id" value="<%= program.id %>">
 <%= form_tag program_path(@program), method: "delete" do %>
    <%= submit_tag "Delete this program" %>
  <% end %>

  <%= form_for @video do |f| %>

    Title: <%= f.text_field :title %><br><br>

    Description: <%= f.text_area :description %><br><br>

    Duration: <%= f.text_field :duration %> min<br><br>

    <%= f.submit %>

<% end %>

Points for navbar:

The navbar starts with the root homepage which shows the options for signing up or logging in or viewing the teacher homepage

so right off the bat we have two homepages: the standard homepage and the teacher homepage

standard homepage:

- can have a photo, a description of the application, and a how-to-use
- links for a user that's not logged-in:
    1. logo: a link to the standard homepage
    2. login
    3. sign-up
    4. teacher's home

- Once a User logs in there should be a different set of links:
    ~ The login, signup links, and teacher's homepage links will go away
    ~ There should be a profile link that takes user to student show page
    1. logo: a link to the standard homepage
    2. programs drop down: your programs, all programs, favorited programs
    3. Teachers drop down: your teachers, all teachers
    4. profile link
    5. logout link

teacher homepage:

- can also have a photo, a description of the application, and a how-to-use from a teacher's perspective
- links for a teacher that's not logged-in:
    1. logo: a link to the teacher homepage
    2. login
    3. sign-up
    4. teacher's home
    
- Once a teacher logs in there should also be a different set of links
    ~ The login link will go away
    ~ There should be a profile link that takes user to teacher show page

    1. logo: a link to the teacher homepage
    2. programs drop down: your programs, all programs, create a new program
    3. videos drop down: your videos, create a new video
    3. Teachers drop down: your teachers, all teachers
    4. profile link
    5. logout link
    

to-dos:

- just create a navbar for a student that is not logged in. 
    some ideas: perhaps login can be a dropdown menu that allows regular login or login with instagram?
- you can then move that to a partial
- you can then create another partial for a teacher that isn't logged in
- Actually, you might as well just make a partial for each navbar you want. so if a student is logged in and if a teacher is logged in.
- you can then write a helper method that will determine which type of user is viewing the page and then render the partial accordingly. 



Link to the blog post:

https://leothebeagle.github.io/omniauth_with_instagram_and_devise

Link to youtube videos:

Demo:

Walkthrough:

Link to github repo:

