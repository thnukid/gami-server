module Gami
  class GamiEngine
    attr_accessor :games

    def initialize
      @games = []
      eval_games
    end

    def run(event)
      #aggregate_attributes for game
      @games.each do |g|
        if game.event.to_s == event.to_s
          game.validate
        end
      end
    end


    private
    def eval_games
      load_games.each do |game|
        @games << eval(game)
      end
    end

    def load_games
      raw_games = []
      Dir.glob(File.dirname(__FILE__) + "/games/*.gami") do |gami_file|
        raw_games << File.read(gami_file) {
          |file| file.read
        }
      end
      raw_games
    end
  end
end
