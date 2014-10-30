module Gami
  class GamiEngine
    attr_accessor :games

    def initialize
      puts "I am a engine"
      @games = []
      Dir.glob(File.dirname(__FILE__) + "/games/*.gami") do |gami_file|
        @games << File.read(gami_file) {
          |file| file.read
        }
        puts @games
      end
    end
  end
end
