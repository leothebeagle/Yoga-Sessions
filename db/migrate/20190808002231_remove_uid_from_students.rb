class RemoveUidFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :uid 
  end
end
