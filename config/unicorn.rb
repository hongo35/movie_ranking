application = 'movie_ranking'

worker_processes 2
timeout 60
preload_app true

listen "/var/run/unicorn/unicorn_#{application}.sock"
pid "/var/run/unicorn/unicorn_#{application}.pid"

stdout_path "/var/log/unicorn/unicorn.stdout_#{application}.log"  # 標準出力ログ出力先
stderr_path "/var/log/unicorn/unicorn.stderr_#{application}.log"  # 標準エラー出力ログ出力先

GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end

  sleep 1
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
