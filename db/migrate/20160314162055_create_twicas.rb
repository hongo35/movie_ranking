class CreateTwicas < ActiveRecord::Migration
  def change
    create_table :twicas, id: false, options: 'engine=MYISAM' do |t|
      t.string :mid, null: false
      t.string :uid, null: false
      t.string :title, null: false, limit: 1023
      t.string :localized_title, null: false, limit: 1023
      t.string :url, null: false, limit: 1023
      t.boolean :islive, null: false
      t.string :img_url, null: false, limit: 1023
      t.integer :comment_cnt, null: false
      t.integer :total_cnt, null: false
      t.datetime :broadcasted_at, null: false

      t.timestamps null: false

      t.index :islive
    end

    execute 'ALTER TABLE twicas add primary key (mid)'
  end
end
