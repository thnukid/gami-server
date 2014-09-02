require 'bundler/capistrano'
ssh_options[:forward_agent] = true
set :keep_releases, 3
set :domain, 'root@178.79.154.34'

# adjust if you are using RVM, remove if you are not
#require "rvm/capistrano"
#set :rvm_ruby_string, '1.9.3'
#set :rvm_type, :user

# file paths
set :repository,  "git@github.com:thnukid/hello-ruby.git"
set :deploy_to, "/var/www/hello-ruby.com" 

# distribute your applications across servers (the instructions below put them
# all on the same server, defined above as 'domain', adjust as necessary)
role :app, domain
role :web, domain
role :db, domain, :primary => true

# you might need to set this if you aren't seeing password prompts
# default_run_options[:pty] = true

# As Capistrano executes in a non-interactive mode and therefore doesn't cause
# any of your shell profile scripts to be run, the following might be needed
# if (for example) you have locally installed gems or applications.  Note:
# this needs to contain the full values for the variables set, not simply
# the deltas.
# default_environment['PATH']='<your paths>:/usr/local/bin:/usr/bin:/bin'
# default_environment['GEM_PATH']='<your paths>:/usr/lib/ruby/gems/1.8'
# miscellaneous options
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production

namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
   # run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
     #after 'deploy:update_code', 'deploy:seed'
  end
end

namespace :rails_config do
    desc "Copy the important config files to the current release"
      task :symlink, roles: :app do
            run "cp #{shared_path}/database.yml #{release_path}/config/database.yml"
        end
        after "deploy:finalize_update", "rails_config:symlink"
        after 'deploy:update_code', 'deploy:migrate'
        after "deploy:restart", "deploy:cleanup"
end

namespace :passenger do
    task :start do end
      task :stop  do end
        task :restart do
              run "touch #{current_path}/tmp/restart.txt"
                end
          after 'deploy:restart', 'passenger:restart'
end
