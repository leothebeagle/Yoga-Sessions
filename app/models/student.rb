class Student < ApplicationRecord
    has_many :student_programs
    has_many :programs, through: :student_programs
    has_many :teachers, through: :programs 
end
