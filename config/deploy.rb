
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`



# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

set :application, 'timesheet'
set :domain, 'localhost'
set :deploy_via, :remote_cache
set :scm_verbose, true
set :repository, 'git@github.com:ankushpatiyal/timesheet.git'

set :user, "qc-sf-25"
set :stages, ["staging", "production"]
set :default_stage, "staging"
set :deploy_to, "/opt/project1/second/public"
set :rails_env, :production
set :use_sudo, false
set :scm, :git
role :app, domain
role :web, domain
role :db, domain, :primary => true


