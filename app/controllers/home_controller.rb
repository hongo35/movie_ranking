class HomeController < ApplicationController
  def index
    config = YAML::load_file("#{Rails.root}/config/database.yml")
    client = Mysql2::Client.new(config[Rails.env])

    @res = []
    client.xquery("SELECT url,count(id) AS cnt FROM tw_data_#{(Time.now - 1.days).strftime('%Y%m%d')} WHERE url != '' GROUP BY url ORDER BY cnt DESC LIMIT 10").each do |r|
      @res << {
        'url' => r['url'],
        'vid' => r['url'].split(/\//)[3],
        'cnt' => r['cnt']
      }
    end
  end
end
