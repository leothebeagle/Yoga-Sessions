class RemoveColumnsFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :first_name 
    remove_column :students, :last_name 
    remove_column :students, :email 
    remove_column :students, :password_digest 
  end
end
