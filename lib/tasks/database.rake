namespace :db do
  desc 'Create Table'
  task create_tw_data: :environment do
    options = 'ENGINE=TokuDB ROW_FORMAT=tokudb_small DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci'

    start_date = Date.today
    end_date = Date.today + 4

    unless ENV['START_DATE'].blank?
      start_date = Date.strptime(ENV['START_DATE'], '%Y-%m-%d')
    end
    unless ENV['END_DATE'].blank?
      end_date = Date.strptime(ENV['END_DATE'], '%Y-%m-%d')
    end

    (start_date..end_date).each do |date|
      table_name = "tw_data_#{date.strftime('%Y%m%d')}"
      unless ActiveRecord::Base.connection.table_exists? table_name
        ActiveRecord::Migration.create_table(table_name, :id => false, :options => options) do |t|
          t.column :id, "BIGINT(20) unsigned PRIMARY KEY NOT NULL"
          t.column :uid, "BIGINT(20) unsigned NOT NULL"
          t.string :user_name, null: false
          t.string :nickname, null: false
          t.text :body, null: false
          t.datetime :ts, null: false
          t.date :ts_date, null: false
          t.string :tool, null: false
          t.string :url, null: false, limit: 1023
          t.column :retweet_id, 'BIGINT(20) unsigned NOT NULL'
          t.column :retweet_user_id, 'BIGINT(20) unsigned NOT NULL'
          t.integer :retweet_cnt, null: false
          t.integer :fav_cnt, null: false
          t.float :glocate_x, null: false
          t.float :glocate_y, null: false
          t.column :cnt, 'INT(11) unsigned NOT NULL'
          t.column :link_cnt, 'INT(11) unsigned NOT NULL'
          t.column :linked_cnt, 'INT(11) unsigned NOT NULL'

          t.timestamps

          t.index :url
        end
      end
    end
  end
end
