class CreateSharedVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :shared_videos do |t|
      t.string  :url, null: false, index: true
      t.string  :title, null: false, index: true
      t.string  :thumbnail
      t.integer :duration
      t.string  :author
      t.string  :provider, null: false, index: true
      t.string  :video_id, null: false, index: true
      t.text    :description
      t.references :user, null: false
      t.timestamps
    end
  end
end
