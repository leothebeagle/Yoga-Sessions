class Program < ApplicationRecord
    belongs_to :teacher
    has_many :program_videos
    has_many :videos, through: :program_videos
    has_many :student_programs
    has_many :students, through: :student_programs
end
