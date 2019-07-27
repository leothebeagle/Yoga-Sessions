class ChangeNameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :videos, :name, :title
  end
end
