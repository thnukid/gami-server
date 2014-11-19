require 'active_record'

#Rake tasks for gami toolbelt
namespace :gami do
  namespace :demo do
    desc 'GAMI DEMO : Test'
    task :start => :environment do
     p Gami.load?
    end
  end
end
