require "bundler/capistrano"

# RVM + Capistrano
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, 'ree'

set :application, "Dashboard"
set :scm, :git

set :deploy_to, "/var/www/tcc"

set :scm, :git
set :user, 'tcc'
set :repository, "git@ceol.in:tcc-dashboard.git"
set :branch, "master"
set :deploy_via, :remote_cache

set :use_sudo, false
default_run_options[:pty] = true
 
role :app, "ceol.in"
role :web, "ceol.in"
role :db,  "ceol.in", :primary => true

after "deploy:update_code", "db:symlink"

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

namespace :db do
  desc "Make symlink for database yaml" 
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
  end
end
