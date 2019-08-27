class Program < ApplicationRecord
    scope :by_teacher, -> (teacher) { where(teacher_id: teacher.id)}
    #scopes are always chainable. But also return value is different than a regular class method which could return nil. 
    validates :name, presence: true

    belongs_to :teacher
    has_many :program_videos
    has_many :videos, through: :program_videos
    has_many :library_items 
    has_many :students, through: :library_items 

    def self.most_popular_program
        Program.joins(:library_items).order(:count).group(:program_id).limit(1).first
    end
end




# We want to find the most popular program. Which means we want to pick the program_id that appears the most times in library_items. 
# Program.joins(:library_items).order(:count).group(:program_id).limit(1)