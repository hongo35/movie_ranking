class HomeController < ApplicationController
  def index
    h = Time.now.strftime('%H').to_i
    if h < 2
      @date = params['date'].presence || (Time.now - 1.days).strftime('%F')
    else
      @date = params['date'].presence || Time.now.strftime('%F')
    end

    config = YAML::load_file("#{Rails.root}/config/database.yml")
    client = Mysql2::Client.new(config[Rails.env])

    @res = []
    client.xquery("SELECT * FROM trend_videos WHERE trend_date = ?", @date).each do |v|
      @res << {
        'vid'           => v['vid'],
        'title'         => v['title'],
        'channel'       => v['channel'],
        'channel_title' => v['channel_title'],
        'view_cnt'      => v['view_cnt'],
        'like_cnt'      => v['like_cnt'],
        'dislike_cnt'   => v['dislike_cnt'],
        'fav_cnt'       => v['fav_cnt'],
        'comment_cnt'   => v['comment_cnt']
      }
    end

    @date_format = Time.parse(@date).strftime('%Y年%m月%d日')
  rescue
    @date_format = '------'
  end

  def twicas
    @res = Twicas.where('islive = 1').order('viewer_cnt DESC')
  end

  def video
    @vid = params[:vid]
    @date = params[:date]

    config = YAML::load_file("#{Rails.root}/config/database.yml")
    client = Mysql2::Client.new(config[Rails.env])

    @info = {}
    client.xquery('SELECT * FROM trend_videos WHERE vid = ? AND trend_date = ?', @vid, @date).each do |r|
      @info['title'] = r['title']
      @info['view_cnt'] = r['view_cnt']
      @info['like_cnt'] = r['like_cnt']
      @info['dislike_cnt'] = r['dislike_cnt']
    end

    @date_format = Time.parse(@date).strftime('%m月%d日')
  rescue
    @info = {}
  end

  def ranking
    cids = []
    TrendVideo.select('channel, count(channel) AS cnt').where("trend_date > ?", (Time.now- 10.days).strftime('%F')).group('channel').order('cnt DESC').limit(30).each do |t|
      cids << t['channel']
    end

    @res = Channel.where('cid IN (?)', cids).order('view_cnt DESC')
  end

  def about
  end
end
