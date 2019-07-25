class Video < ApplicationRecord
    belongs_to :teacher
    has_one :program_video
    has_one :program, through: :program_video
end
