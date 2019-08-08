class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    validates :first_name, presence: true
    
    validates :last_name, presence: true

    validates :bio, presence: true

    validates :email, presence: true, uniqueness: true


    has_many :videos
    has_many :programs
    has_many :students, through: :programs 
end
