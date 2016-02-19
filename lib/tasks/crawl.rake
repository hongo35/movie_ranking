require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/installed_app'
require 'open-uri'

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

  desc 'get movie info'
  task movie_info: :environment do
    config   = YAML::load_file("#{Rails.root}/config/setting.yml")
    dbconfig = YAML::load_file("#{Rails.root}/config/database.yml")
    con      = Mysql2::Client.new(dbconfig[Rails.env])

    client = Google::APIClient.new(
      :application_name => 'youtube',
      :application_version => '0.0,1'
    )
    client.authorization = nil
    youtube = client.discovered_api('youtube','v3')

    con.xquery("SELECT url,count(id) AS cnt FROM tw_data_#{Time.now.strftime('%Y%m%d')} WHERE url != '' AND rt_id = 0 GROUP BY url ORDER BY cnt DESC LIMIT 10").each do |r|
      vid = r['url'].split('?')[0].split(/\//)[3]

      res = client.execute :key => config['youtube']['key'], :api_method => youtube.videos.list, :parameters => {:id => vid, :part => 'snippet, statistics'}
      json = Oj.load(res.response.body)

      view_cnt = json['items'][0]['statistics']['viewCount'].nil? ? 0 : json['items'][0]['statistics']['viewCount']
      comment_cnt = json['items'][0]['statistics']['commentCount'].nil? ? 0 : json['items'][0]['statistics']['commentCount']
      like_cnt = json['items'][0]['statistics']['likeCount'].nil? ? 0 : json['items'][0]['statistics']['likeCount']
      dislike_cnt = json['items'][0]['statistics']['dislikeCount'].nil? ? 0 : json['items'][0]['statistics']['dislikeCount']
      fav_cnt = json['items'][0]['statistics']['favoriteCount'].nil? ? 0 : json['items'][0]['statistics']['favoriteCount']

      ts = Time.now
      con.xquery('INSERT INTO videos(vid, title, channel, view_cnt, like_cnt, dislike_cnt, fav_cnt, comment_cnt, created_at, updated_at) VALUES(?,?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE view_cnt = ?, like_cnt = ?, dislike_cnt = ?, fav_cnt = ?, comment_cnt = ?, updated_at = ?', vid, json['items'][0]['snippet']['title'], json['items'][0]['snippet']['channelId'], view_cnt, like_cnt, dislike_cnt, fav_cnt, comment_cnt, ts, ts, view_cnt, like_cnt, dislike_cnt, fav_cnt, comment_cnt, ts)
    end
  end

  desc 'get youtube trend'
  task youtube_trend: :environment do
    vids = []

    url = 'https://www.youtube.com/feed/trending'
    page = open(url)
    html = Nokogiri::HTML(page.read, nil)

    list = html.search('ul.expanded-shelf-content-list > li')
    list.each do |li|
      href = li.search('div.expanded-shelf-content-item > div.yt-lockup > div.yt-lockup-dismissable > div.yt-lockup-thumbnail > a').attribute('href').to_s

      vids << href.split('=')[1]
    end

    config   = YAML::load_file("#{Rails.root}/config/setting.yml")
    dbconfig = YAML::load_file("#{Rails.root}/config/database.yml")
    con      = Mysql2::Client.new(dbconfig[Rails.env])

    client = Google::APIClient.new(
      :application_name => 'youtube',
      :application_version => '0.0,1'
    )
    client.authorization = nil
    youtube = client.discovered_api('youtube','v3')

    vids.each do |vid|
      res = client.execute :key => config['youtube']['key'], :api_method => youtube.videos.list, :parameters => {:id => vid, :part => 'snippet, statistics'}
      json = Oj.load(res.response.body)

      view_cnt = json['items'][0]['statistics']['viewCount'].nil? ? 0 : json['items'][0]['statistics']['viewCount']
      comment_cnt = json['items'][0]['statistics']['commentCount'].nil? ? 0 : json['items'][0]['statistics']['commentCount']
      like_cnt = json['items'][0]['statistics']['likeCount'].nil? ? 0 : json['items'][0]['statistics']['likeCount']
      dislike_cnt = json['items'][0]['statistics']['dislikeCount'].nil? ? 0 : json['items'][0]['statistics']['dislikeCount']
      fav_cnt = json['items'][0]['statistics']['favoriteCount'].nil? ? 0 : json['items'][0]['statistics']['favoriteCount']

      ts   = Time.now
      date = ts.strftime('%F')
      con.xquery('INSERT INTO trend_videos(vid, title, channel, view_cnt, like_cnt, dislike_cnt, fav_cnt, comment_cnt, trend_date, created_at, updated_at) VALUES(?,?,?,?,?,?,?,?,?,?,?)', vid, json['items'][0]['snippet']['title'], json['items'][0]['snippet']['channelId'], view_cnt, like_cnt, dislike_cnt, fav_cnt, comment_cnt, date, ts, ts)
    end
  end
end
