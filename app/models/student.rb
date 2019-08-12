class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_secure_password
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :password, presence: true
  # validates :password_confirmation, presence: true
  
  has_many :library_items
  has_many :programs, through: :library_items 
  has_many :teachers, through: :programs 

  def favorite_programs
    favorited_library_items = self.library_items.where(favorited: true)
    favorite_programs = favorited_library_items.collect { |item| item.program }
  end
end
