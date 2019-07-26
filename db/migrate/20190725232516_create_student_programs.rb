class CreateStudentPrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :student_programs do |t|
        t.integer :student_id
        t.integer :program_id
        t.boolean :favorited, default: false
      t.timestamps
    end
  end
end
