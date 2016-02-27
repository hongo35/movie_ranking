class CreateChannel < ActiveRecord::Migration
  def change
    create_table :channels, id: false, options: 'engine=MYISAM' do |t|
      t.column :cid, 'VARCHAR(255) PRIMARY KEY NOT NULL'
      t.string :title, null: false, limit: 1023
      t.text :description, null: false
      t.datetime :published_at, null: false
      t.string :img_url, null: false
      t.integer :view_cnt, null: false
      t.integer :comment_cnt, null: false
      t.integer :subscriber_cnt, null: false
      t.integer :video_cnt, null: false

      t.timestamps null: false
    end
  end
end
