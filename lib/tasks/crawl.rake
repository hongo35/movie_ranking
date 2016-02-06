namespace :crawl do
  desc 'Twitter Search'
  task tw_search: :environment do
    config = YAML::load_file("#{Rails.root}/config/setting.yml")
    client = Twitter::REST::Client.new(config['tw'])

    start_ts = Time.now
    tweets = client.search('youtu.be', lang: 'ja').take(100)
    tweets.each do |t|
      id  = t.id
      uid = t.user.id
      user_name       = t.user.screen_name
      nickname        = t.user.name
      profile_img_url = t.user.profile_image_url
      body            = t.text
      ts              = t.created_at.strftime('%F %T')
      ts_date         = t.created_at.strftime('%F')
      tool            = t.source.gsub(/<(".*?"|'.*?'|[^'"])*?>/, '')
      cnt             = tweet.user.tweets_count
      link_cnt        = tweet.user.friends_count
      linked_cnt      = tweet.user.followers_count

      urls = []
      expanded_urls = []
      if tweet.attrs[:entities][:urls].length > 0
        t.attrs[:entities][:urls].each do |url|
          unless urls.include?(url[:url])
            urls << url[:url]
            expanded_urls << url[:expanded_url]
          end
        end
      end

      binding.pry
    end
  end
end
