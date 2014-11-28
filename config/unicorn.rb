=begin

Love that you guys forged ahead and configured unicorn.  People are also talking a lot about raptor this day. You can read about it here.

http://www.rubyraptor.org/how-we-made-raptor-up-to-4x-faster-than-unicorn-and-up-to-2x-faster-than-puma-torquebox/

=end


worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    msg  = 'Unicorn worker intercepting TERM and doing nothing. '
    msg += 'Wait for master to send QUIT'
    puts msg
  end

  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end