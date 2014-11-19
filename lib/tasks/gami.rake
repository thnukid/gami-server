require 'active_record'

#Rake tasks for gami toolbelt
namespace :gami do


  #Wipe gami data

  namespace :wipe do
    desc "GAMI TOOLBELT : Complete wipeout all game related data, facts and badges"
    task :all => [:badges, :facts] do
      f = Fact.all.count
      b = Badge.all.count
      puts "(╯°□°）╯︵ ┻━┻  Wiped all the things! Now there are #{f} Facts and #{b} Badges"
    end

    desc "GAMI TOOLBELT : Wipe Badges"
    task badges: :environment do
      s = Badge.all.count
      puts "Want to delete #{s} Badge? (Y/N)"
      @confirm = STDIN.gets.chomp.downcase

      if @confirm == 'y'
        Badge.all.each do |b| 
          puts b.destroy
        end
      end
    end

  desc "GAMI TOOLBELT : Wipe Facts"
  task facts: :environment do
    s = Fact.all.count
    puts "Want to delete #{s} Facts? (Y/N)"
    @confirm = STDIN.gets.chomp.downcase

    if @confirm == 'y'
      Fact.all.each do |b| 
        puts b.destroy
      end
    end
  end

  end
end
