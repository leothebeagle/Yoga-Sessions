class Teacher < ApplicationRecord
    has_many :videos
    has_many :programs
end
