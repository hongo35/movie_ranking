require 'net/http'

namespace :batch do
  desc 'channels'
  task youtube_channel: :environment do
    config   = YAML::load_file("#{Rails.root}/config/setting.yml")
    dbconfig = YAML::load_file("#{Rails.root}/config/database.yml")
    con      = Mysql2::Client.new(dbconfig[Rails.env])

    client = Google::APIClient.new(
      :application_name => 'youtube',
      :application_version => '0.0,1'
    )
    client.authorization = nil
    youtube = client.discovered_api('youtube','v3')

    con.xquery('SELECT channel,count(channel) AS cnt FROM trend_videos WHERE trend_date > ? GROUP BY channel ORDER BY cnt DESC LIMIT 30', (Time.now - 10.days).strftime('%F')).each do |r|
      res = client.execute :key => config['youtube']['key'], :api_method => youtube.channels.list, :parameters => {:id => r['channel'], :part => 'snippet, contentDetails, statistics'}
      json = Oj.load(res.response.body)

      title          = json['items'][0]['snippet']['title'].presence || ''
      description    = json['items'][0]['snippet']['description'].presence || ''
      published_at   = json['items'][0]['snippet']['publishedAt'].presence || '0000-00-00 00:00:00'
      img_url        = json['items'][0]['snippet']['thumbnails']['high']['url'].presence || ''
      view_cnt       = json['items'][0]['statistics']['viewCount'].presence || 0
      comment_cnt    = json['items'][0]['statistics']['commentCount'].presence || 0
      subscriber_cnt = json['items'][0]['statistics']['subscriberCount'].presence || 0
      video_cnt      = json['items'][0]['statistics']['videoCount'].presence || 0

      ts = Time.now
      con.xquery("INSERT INTO channels(cid, title, description, published_at, img_url, view_cnt, comment_cnt, subscriber_cnt, video_cnt, created_at, updated_at) VALUES(?,?,?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE view_cnt = ?, comment_cnt = ?, subscriber_cnt = ?, video_cnt = ?, updated_at = ?", r['channel'], title, description, Time.parse(published_at).getlocal, img_url, view_cnt, comment_cnt, subscriber_cnt, video_cnt, ts, ts, view_cnt, comment_cnt, subscriber_cnt, video_cnt, ts)

      sleep(1)
    end
  end

  desc 'download'
  task youtube_download: :environment do
    TrendVideo.select('vid').where('trend_date = ?', Time.now.strftime('%F')).limit(2).each do |v|
      # system("/usr/local/bin/youtube-dl -f 5 -o #{Rails.root}/tmp/videos/#{v['vid']}.flv https://www.youtube.com/watch?v=#{v['vid']}")
      system("/usr/local/bin/ffmpeg -i #{Rails.root}/tmp/videos/#{v['vid']}.flv #{Rails.root}/tmp/videos/#{v['vid']}.wav")
      system("rm #{Rails.root}/tmp/videos/#{v['vid']}.flv")
    end
  end
end
