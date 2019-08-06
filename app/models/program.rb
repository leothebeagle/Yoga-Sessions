class Program < ApplicationRecord
    scope :by_teacher, -> (teacher) { where(teacher_id: teacher.id)}

    belongs_to :teacher
    has_many :program_videos
    has_many :videos, through: :program_videos
    has_many :library_items 
    has_many :students, through: :library_items 
end
