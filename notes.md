To-do's:

* Link teachers to students
    has_many :students, through: :programs
* Link videos to students
    has_many :students, through: :programs
* Link students to teachers
    has_many :teachers, through: :programs
    
* Down the line, depending on whether its needed or not, may link students to videos