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
  
  desc "Cria os links simbolicos para o database.yml e para a pasta assets"
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

after :deploy, 'deploy:symlink_shared'