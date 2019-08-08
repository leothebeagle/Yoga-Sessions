class CreateLibraryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :library_items do |t|
        t.integer :student_id
        t.integer :program_id
        t.boolean :favorited, default: false
      t.timestamps
    end
  end
end
