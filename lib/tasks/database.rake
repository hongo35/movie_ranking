namespace :database do
  desc 'create tw_data table'
  task create_tw_data: :environment do
    options = 'ENGINE=MYISAM CHARSET=utf8 COLLATE=utf8_unicode_ci'

    start_date = Date.today
    end_date   = Date.today + 4

    unless ENV['START_DATE'].blank?
      start_date = Date.strptime(ENV['START_DATE'], '%F')
    end
    unless ENV['END_DATE'].blank?
      end_date = Date.strptime(ENV['END_DATE'], '%F')
    end

    (start_date..end_date).each do |date|
      table_name = "tw_data_#{date.strftime('%Y%m%d')}"
      unless ActiveRecord::Base.connection.table_exists? table_name
        ActiveRecord::Migration.create_table(table_name, id: false, options: options) do |t|
          t.column :id, 'BIGINT(20) unsigned PRIMARY KEY NOT NULL'
          t.column :uid, 'BIGINT(20) unsigned NOT NULL'
          t.string :user_name, null: false
          t.string :nickname, null: false
          t.binary :body, null: false
          t.datetime :ts, null: false
          t.date :ts_date, null: false
          t.string :tool, null: false
          t.string :url, null: false, limit: 1023
          t.column :rt_id, 'BIGINT(20) unsigned NOT NULL'
          t.column :rt_user_id, 'BIGINT(20) unsigned NOT NULL'
          t.integer :rt_cnt, null: false
          t.integer :like_cnt, null: false
          t.float :lat, null: false
          t.float :lon, null: false
          t.column :cnt, 'INT(11) unsigned NOT NULL'
          t.column :friend_cnt, 'INT(11) unsigned NOT NULL'
          t.column :follower_cnt, 'INT(11) unsigned NOT NULL'

          t.timestamps

          t.index :url
        end
      end
    end
  end
end
