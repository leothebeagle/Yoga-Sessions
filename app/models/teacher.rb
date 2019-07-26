class Teacher < ApplicationRecord
    has_secure_password

    has_many :videos
    has_many :programs
    has_many :students, through: :programs 
end
