class CreateTrendVideo < ActiveRecord::Migration
  def change
    create_table :trend_videos, id: false, options: 'engine=MYISAM' do |t|
      t.string :vid, null: false
      t.string :title, null: false, limit: 1023
      t.string :channel, null: false
      t.integer :view_cnt, null: false
      t.integer :like_cnt, null: false
      t.integer :dislike_cnt, null: false
      t.integer :fav_cnt, null: false
      t.integer :comment_cnt, null: false
      t.date :trend_date, null: false

      t.timestamps null: false
    end

    execute 'ALTER TABLE trend_videos add primary key (vid, trend_date)'
  end
end
