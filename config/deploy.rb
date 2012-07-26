require "rvm/capistrano"
require "capistrano_colors"
require 'bundler/capistrano'
require './config/boot'

#set :rvm_ruby_string, "ruby-1.9.3-p194"
set :rvm_type, :system

set :application, "hypertech.com.ua"
set :repository,  "git@github.com:smostovoy/store.git"
set :branch, "master"
set :scm, :git
set :ssh_options, {:forward_agent => true}

set :rails_env, "development"
role :web, "hypertech.com.ua"                          # Your HTTP server, Apache/etc
role :app, "hypertech.com.ua"                          # This may be the same as your `Web` server
role :db,  "hypertech.com.ua", :primary => true # This is where Rails migrations will run

set :unicorn_conf, "#{deploy_to}/current/config/unicorn/development.rb"


set :user, "administrator"
set :deploy_to, "/home/deploy/#{application}"
set :use_sudo, false
set :keep_releases, 5
set :bundle_flags,    "--deployment"
#set :notify_emails, ['svmostovoy@gmail.com']

set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

before 'deploy:setup', 'rvm:install_ruby'
after "deploy:update_code", "deploy:symlinks"
after "deploy:update_code", "deploy:migrate"
after "deploy:restart", "deploy:cleanup"
load 'deploy/assets'

namespace :deploy do
  desc "Update symlinks"
  task :symlinks do
    run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml"
    #run "rm #{deploy_to}/shared/config/nginx.conf"
    #run "ln -s #{deploy_to}/current/config/servers/production/nginx.conf #{deploy_to}/shared/config/nginx.conf"
  end
end

require 'capistrano-unicorn'

