module Gami
  class GamiEngine
    attr_accessor :games, :dsl_path


    def initialize(dsl_load_path=nil)
      @games = []

      if dsl_load_path
        @dsl_path = dsl_load_path
      else
        @dsl_path = File.dirname(__FILE__) + "/games/*.gami"
      end
      eval_games
    end

    def run(event)
      aggregate_properties(event) #aggregates facts based on the event with all defined properties passed

      #loops through evaled game dsl
      #validates the game when the event matches eg. git:pushi
      #game has event as string, event.name is the rails model event
      @games.each do |game|
        game.run(event) if game.event.to_s == event.name.to_s
      end
    end
    
    def aggregate_properties(event)
      event.aggregate_properties(properties)
    end
    #flatten the array (1dimension)
    #map/retrieve the properties of games
    def properties
      games.flat_map(&:properties).uniq
    end

    #Reading the DSL into a games array
    #gets evaluated directly since module definition of Game.define
    def eval_games
      load_games.each do |game|
        @games << eval(game)
      end
    end

    def load_games
      raw_games = []
      Dir.glob(dsl_path) do |gami_file|
        raw_games << File.read(gami_file) {
          |file| file.read
        }
      end
      raw_games
    end
  end
end
