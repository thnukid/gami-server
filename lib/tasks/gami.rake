require 'active_record'
namespace :gami do

  desc "TODO: Set a fact to an number"
  task set_fact_todo: :environment do

    #puts "Fact name?:"

    #@fact = {}
    #@fact[:name] = STDIN.gets.chomp
    #@real_fact = Fact.where("aggregated_value" : @fact[:name])
    #puts "Fact aggregation value?:"
    #@fact[:value] = STDIN.gets.chomp

    #if @fact[:name] && @fact[:value]
      #puts @fact.inspect
    #else
      #return false
    #end
  end

  desc "Reset Gami Badges"
  task badge: :environment do
    s = Badge.all.count
    puts "Want to delete #{s} Badge? (Y/N)"
    @confirm = STDIN.gets.chomp.downcase

    if @confirm == 'y'
    Badge.all.each do |b| 
      puts b.destroy
    end
    end
  end

  desc "Reset Gami Badges"
  task fact: :environment do
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
