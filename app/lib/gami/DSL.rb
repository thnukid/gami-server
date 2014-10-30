module Game
  def self.define(description, &block)
    dsl_instance = GamiDSL.new description
    dsl_instance.instance_eval(&block)
    Gami::GamiEngine.new.add_game = dsl_instance.game
  end
end

class GamiDSL
  attr_accessor :game_config, :game

  def initialize(description)
    @game_config = {:description => description}
    self
  end

  def on_event(event)
    puts event
    @game_config[:event] =  event
    puts @game_config.inspect
    #create a game to stuff the rules later in, based on config sofar
    @game = Gami::GamiGame.new(@game_config[:description], @game_config[:event], "user")
    #run the rest of the block in this class context, eg. receive_badge
    yield
  end

  def receive_badge(name, options = {})
    name = options[:label]
    label = options[:with_label]
    block = condition(options)

    #attach the rule to the game
    @game.rule(label, name, &block)

  end

  def condition(options = {})
    
    #this need to come from the database later
    property = options[:using_property]
    property_value = value_for(property)


    #move like mic jagger through opts to find the condition eg. lteq
    #and return a proc to be used in the block by the rule
    options.keys.each do |elm|
      case elm.to_s
      when 'lteq'
        return Proc.new {
          options[:lteq] <= property_value
        }
      end
    end
  end

  #returns the fact from the database
  def value_for(prop)
   49 
  end


  def print2
    game.validate?
    game.results.each do |b|
      puts b.inspect
    end
    #puts @game.inspect
  end
end

  puts '###start dsl'
  #load ('DSL_Game.rb')

  Game.define "Receive badges for commiting to github" do
    on_event "git:push" do
      receive_badge "Boarding", with_label: "Welcome, to the crew! ", using_property: "commit" , lteq: 1
      receive_badge "Intern", with_label: "You slowly getting accquainted with the code.", using_property: 'commit', lteq: 10
      receive_badge "Apprenticeships", with_label: "You making progress. Diving into the codebase.", using_property: 'commit', lteq: 20
      receive_badge "Junior", with_label: "Way to go! You are contributing to the team effort.", using_property: 'commit', lteq: 30
      receive_badge "Senior", with_label: "You became a core member of the team, congratulations", using_property: 'commit', lteq: 40
      receive_badge "PwnAge", with_label: "Code becomes you, you becomes code", using_property: 'commit', lteq: 50
    end
  end
  puts "###End Reading"

