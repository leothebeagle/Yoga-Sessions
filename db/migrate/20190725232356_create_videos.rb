class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :name
      t.string :description
      t.string :duration
      t.integer :teacher_id
      
      t.timestamps
    end
  end
end
