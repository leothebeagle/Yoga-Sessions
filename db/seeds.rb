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

# Create videos:

v_one = amina.videos.create(title: "Vinyasa video 1", description: "first video of the Vinyasa Series", duration: "30")
v_two = amina.videos.create(title: "Vinyasa video 2", description: "second video of the Vinyasa Series", duration: "30")
v_three = amina.videos.create(title: "Vinyasa video 3", description: "third video of the Vinyasa Series", duration: "30")


h_one = amina.videos.create(title: "Hatha video 1", description: "first video of the Hatha Series", duration: "40")
h_two = amina.videos.create(title: "Hatha video 2", description: "second video of the Hatha Series", duration: "40")
h_three = amina.videos.create(title: "Hatha video 3", description: "third video of the Hatha Series", duration: "40")


#Create Programs:

vinyasa_series = amina.programs.create(name: "Vinyasa Series", description: "A 3 day vinyasa series")
vinyasa_series.videos << v_one
vinyasa_series.videos << v_two
vinyasa_series.videos << v_three

hatha_series = amina.programs.create(name: "Hatha Series", description: "A 3 day hatha series")
hatha_series.videos << h_one
hatha_series.videos << h_two 
hatha_series.videos << h_three

# add programs to student libraries:

carlos.programs << vinyasa_series 
george.programs << hatha_series 
leo.programs << vinyasa_series 
leo.programs << hatha_series 