class Program < ApplicationRecord
    belongs_to :teacher
    has_many :program_videos
    has_many :videos, through: :program_videos
end
