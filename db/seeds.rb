# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Teachers:
amina = Teacher.new(first_name: "Amina", last_name: "Taha", email: "amina@teacher.com", bio: "A yogini from Egypt", password: "password", password_confirmation: "password")
amina.save

sylvia = Teacher.new(first_name: "Sylvia", last_name: "Eid", email: "sylvia@teacher.com", bio: "A vegan yogini from Heliopolis", password: "password", password_confirmation: "password")
sylvia.save

kirollos = Teacher.new(first_name: "kirollos", last_name: "Abdelmessih", email: "kirollos@teacher.com", bio: "A peaceful yogi from Cairo", password: "password", password_confirmation: "password")
kirollos.save

# Students:
leo = Student.new(first_name: "Leo", last_name: "Beagsley", email: "leo@student.com", password: "password", password_confirmation: "password")
leo.save

carlos = Student.new(first_name: "Carlos", last_name: "Zambrano", email: "carlos@student.com", password: "password", password_confirmation: "password")
carlos.save

george = Student.new(first_name: "George", last_name: "Saad", email: "george@student.com", password: "password", password_confirmation: "password")
george.save