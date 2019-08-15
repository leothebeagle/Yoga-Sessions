class Student < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[instagram]

  has_many :library_items
  has_many :programs, through: :library_items 
  has_many :teachers, through: :programs 

  def favorite_programs
    favorited_library_items = self.library_items.where(favorited: true)
    favorite_programs = favorited_library_items.collect { |item| item.program }
  end

  def has_program?(program)
    self.programs.include?(program)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |student|
      student.email = auth.info.nickname + "@student.com"
      student.password = Devise.friendly_token[0, 20]
      student.first_name = auth.info.name 
    end
  end
end
