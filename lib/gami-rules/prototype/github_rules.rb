require 'json'

class Rule
  attr_accessor :description, :badge, :block, :data

  def initialize(description, badge, &block)
    @description = description
    @badge = badge
    @block = block
  end

  def applies?
    is_true = true #always true, without block
    unless self.block.nil?
      is_true = self.block.call(data) #is it true?, pass data to the anon function
    end
  end

  def to_s
    "rule: #{description} assign #{badge}, evaluate #{block} = #{self.applies?}"
  end
end

class GamiEngine
  attr_reader :description, :event, :fact, :rules

  def initialize(description, event, &rules)
    @description = description
    @event = event

    @payload = open("../../spec/fixtures/github_payload.json").read
    @fact = JSON.load(@payload)

    @rules ||= []
  end

  def rule(description, badge, &block)
    #add rules to array
      rules << Rule.new(description, badge, &block)
  end

  def validate?
    rules.each do |r|
      r.data = fact #set data for rules
      r.applies?
    end
  end

  def to_s
    "On '#{event}' #{description} has #{rules.count} rules"
  end
end


puts "Gami is starting a new game"

game = GamiEngine.new "Gives a user badges based on github commits", 'git:commit' 
game.rule "Welcome on board!", 'newbie' do |data|
      data["commits"].count == 100
  end
game.rule "on board!", 'newbie' do |data|
      data["commits"].count == 1
  end


puts game
puts game.validate?
#game = GamiEngine.new "Gives a user badges based on github commits", 'git:commit' do |s,d| 
    ##data["commits"].count

    ##rule "yyy"
    #Rule.new "Welcome on board!", 'newbie' do
      #data["commits"].count == 100
     #end

    ##rule "You coming back for more fun", :badge => 'stagaire' do
      ##commits.total == 5
    ##end

    ##rule "You starting to make it better", :badge => 'developer' do
      ##commits.total == 8
    ##end
#end

