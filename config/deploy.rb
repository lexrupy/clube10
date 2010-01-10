set :scm, "git"
set :branch, "master"
default_run_options[:pty] = true
default_environment["PATH"] = "/opt/ruby-enterprise/bin:/usr/local/bin:/usr/bin:/bin"

set :repository,  "git://github.com/lexrupy/clube10.git"

set :user, "clube10"

set :deploy_to, "/home/#{user}/web_root"
set :use_sudo, false

ssh_options[:port] = 2222
default_run_options[:pty] = false

server "ssh.railscluster.nl", :app, :web, :db, :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end