class HomeController < ApplicationController
  def index
    config = YAML::load_file("#{Rails.root}/config/database.yml")
    client = Mysql2::Client.new(config[Rails.env])

    vids = []
    @res = []
    client.xquery("SELECT url,count(id) AS cnt FROM tw_data_#{Time.now.strftime('%Y%m%d')} WHERE url != '' AND rt_id = 0 AND created_at < '#{(Time.now - 15.minutes).strftime('%F %T')}' GROUP BY url ORDER BY cnt DESC LIMIT 10").each do |r|
      vids << r['url'].split('?')[0].split(/\//)[3]

      @res << {
        'url' => r['url'],
        'vid' => r['url'].split('?')[0].split(/\//)[3],
        'cnt' => r['cnt']
      }
    end

    @info = {}
    client.xquery("SELECT * FROM videos WHERE vid IN (?)", vids).each do |v|
      @info[v['vid']] = {
        'title'       => v['title'],
        'channel'     => v['channel'],
        'view_cnt'    => v['view_cnt'],
        'like_cnt'    => v['like_cnt'],
        'dislike_cnt' => v['dislike_cnt'],
        'fav_cnt'     => v['fav_cnt'],
        'comment_cnt' => v['comment_cnt']
      }
    end
  end
end
