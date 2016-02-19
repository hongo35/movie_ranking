class HomeController < ApplicationController
  def index
    @date = params['date'].presence || Time.now.strftime('%F')

    config = YAML::load_file("#{Rails.root}/config/database.yml")
    client = Mysql2::Client.new(config[Rails.env])

    @res = []
    client.xquery("SELECT * FROM trend_videos WHERE trend_date = ?", @date).each do |v|
      @res << {
        'vid'         => v['vid'],
        'title'       => v['title'],
        'channel'     => v['channel'],
        'view_cnt'    => v['view_cnt'],
        'like_cnt'    => v['like_cnt'],
        'dislike_cnt' => v['dislike_cnt'],
        'fav_cnt'     => v['fav_cnt'],
        'comment_cnt' => v['comment_cnt']
      }
    end

    @date_format = Time.parse(@date).strftime('%Y年%m月%d日')
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
  end
end
