class CreateStudentPrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :student_programs do |t|

      t.timestamps
    end
  end
end
