class Student < ApplicationRecord
    has_secure_password

    validates :first_name, presence: true
    
    validates :last_name, presence: true
    
    validates :email, presence: true, uniqueness: true

    validates :password, presence: true
    validates :password_confirmation, presence: true
    
    has_many :student_programs
    has_many :programs, through: :student_programs
    has_many :teachers, through: :programs 
end
