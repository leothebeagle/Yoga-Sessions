class ChangeStudentProgramsToLibrary < ActiveRecord::Migration[5.2]
  def change
    rename_table :student_programs, :library_items
  end
end
