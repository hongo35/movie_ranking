namespace :crawl do
  desc 'Twitter Search'
  task tw_search: :environment do
    config   = YAML::load_file("#{Rails.root}/config/setting.yml")
    dbconfig = YAML::load_file("#{Rails.root}/config/database.yml")
    client   = Twitter::REST::Client.new(config['tw'])
    con      = Mysql2::Client.new(dbconfig[Rails.env])

    tweets = client.search('youtu.be', lang: 'ja').take(100)
    tweets.each do |t|
      tweet_ts = t.created_at + 9.hours

      id  = t.id
      uid = t.user.id
      user_name       = t.user.screen_name
      nickname        = t.user.name
      # profile_img_url = t.user.profile_image_url
      body            = t.text
      ts              = tweet_ts.strftime('%F %T')
      ts_date         = tweet_ts.strftime('%F')
      tool            = t.source.gsub(/<(".*?"|'.*?'|[^'"])*?>/, '')
      cnt             = t.user.tweets_count
      friend_cnt      = t.user.friends_count
      follower_cnt    = t.user.followers_count
      table_date      = tweet_ts.strftime("%Y%m%d")

      expanded_url = ''
      if t.attrs[:entities][:urls].length > 0
        t.attrs[:entities][:urls].each_with_index do |url, i|
          if url[:expanded_url].start_with?('http://youtu.be') or url[:expanded_url].start_with?('https://youtu.be')
            expanded_url = url[:expanded_url] if i == 0
          end
        end
      end

      lat = 0.0
      lon = 0.0
      if t.geo.present?
        lat = t.geo.coordinates[0]
        lon = t.geo.coordinates[1]
      end

      rt_id      = 0
      rt_user_id = 0
      rt_cnt     = 0
      like_cnt   = 0
      if t.retweeted_status.present?
        rt_id      = t.retweeted_status.id
        rt_user_id = t.retweeted_status.user.id
        rt_cnt     = t.retweeted_status.retweet_count
        like_cnt   = t.retweeted_status.favorite_count
      end

      ts = Time.now
      con.xquery("INSERT INTO tw_data_#{table_date}(id,uid,user_name,nickname,body,ts,ts_date,tool,url,rt_id,rt_user_id,rt_cnt,like_cnt,lat,lon,cnt,friend_cnt,follower_cnt, created_at, updated_at) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", id, uid, user_name, nickname, body, ts, ts_date, tool, expanded_url, rt_id, rt_user_id, rt_cnt, like_cnt, lat, lon, cnt, friend_cnt, follower_cnt, ts, ts)
    end
  end
end
