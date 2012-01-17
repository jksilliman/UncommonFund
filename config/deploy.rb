$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"    
set :rvm_ruby_string, '1.9.2' # you probably have this already
set :rvm_type, :user # this is the money config, it defaults to :system


set :bundle_roles, :app
require 'bundler/capistrano'
default_run_options[:pty] = true

set :application, "committees"
set :repository,  "git://github.com/jksilliman/Committees.git"
set :scm, :git
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/committees"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
server "sg.uchicago.edu", :app, :web, :db, :primary => true
set :user, "jksilliman"
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :db do
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=production"
  end
  task :migrate do
    run "cd #{current_path}; bundle exec rake db:migrate RAILS_ENV=production"
  end
end

