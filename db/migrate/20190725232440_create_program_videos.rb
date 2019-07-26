class CreateProgramVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :program_videos do |t|
      t.integer :program_id 
      t.integer :video_id 

      t.timestamps
    end
  end
end
