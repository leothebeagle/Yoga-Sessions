class Video < ApplicationRecord

    validates :title, presence: true

    belongs_to :teacher
    has_one :program_video
    has_one :program, through: :program_video
    has_many :students, through: :program 
end
