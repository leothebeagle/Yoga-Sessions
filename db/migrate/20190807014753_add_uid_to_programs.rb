class AddUidToPrograms < ActiveRecord::Migration[5.2]
  def change
    add_column :programs, :uid, :integer
  end
end
