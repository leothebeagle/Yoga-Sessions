class Program < ApplicationRecord
    belongs_to :teacher
    has_many :program_videos
    has_many :videos, through: :program_videos
    has_many :library_items 
    has_many :students, through: :library_items 
end
