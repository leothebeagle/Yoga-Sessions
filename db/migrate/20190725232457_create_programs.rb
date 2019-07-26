class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :description
      t.integer :teacher_id
      
      t.timestamps
    end
  end
end
