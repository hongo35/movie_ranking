class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos, id: false, options: 'engine=MYISAM' do |t|
      t.column :vid, 'VARCHAR(255) PRIMARY KEY NOT NULL'
      t.string :title, null: false, limit: 1023
      t.string :channel, null: false
      t.integer :view_cnt, null: false
      t.integer :like_cnt, null: false
      t.integer :dislike_cnt, null: false
      t.integer :fav_cnt, null: false
      t.integer :comment_cnt, null: false

      t.timestamps null: false
    end
  end
end
