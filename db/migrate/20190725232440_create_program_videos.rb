class CreateProgramVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :program_videos do |t|

      t.timestamps
    end
  end
end
