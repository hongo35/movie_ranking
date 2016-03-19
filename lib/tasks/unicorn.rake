namespace :unicorn do
  desc 'start unicorn'
  task start: :environment do
    config = File.expand_path('config/unicorn.rb', Rails.root)
    sh "bundle exec unicorn_rails -c #{config} -E production -D"
  end

  desc 'stop unicorn'
  task stop: :environment do
    unicorn_signal :QUIT
  end

  desc 'restart unicorn with USR2'
  task restart: :environment do
    unicorn_signal :USR2
  end

  def unicorn_signal signal
    Process.kill signal, unicorn_pid
  end

  def unicorn_pid
    begin
      File.read("/var/run/unicorn/unicorn_movie_ranking.pid").to_i
    rescue Errno::ENOENT
      raise "unicorn doesn't seem to be running"
    end
  end
end
