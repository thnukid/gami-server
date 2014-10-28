module Gami
  class GamiEngine

    def self.run(event)
      called_game = convert_event_to_class(event.name)

      loaded_games.each do |game|
        return class_send(called_game, "perform_game", event.user) if called_game.include? @game.to_s
      end
    end

    private
    #available games, TODO: load dynamic
    def self.loaded_games
      games = []
      Dir.glob("games/*.rb") do |game_file|
        games << game_file.class.name.split('::').last if require_relative game_file
      end
      games
    end

    #calls the defined game
    def self.class_send(class_name, method, *args)
      return nil unless Object.const_defined?(class_name)
      c = Object.const_get(class_name)
      c.respond_to?(method) ? c.send(method, *args) : nil
    end

    #expect that the event is seperated by "{service}:{event}"
    def self.convert_event_to_class(event_name)
      event_name.titleize.tr(':','').prepend("Gami::")
    end

    def self.convert_event_to_file(event_name)
      event_name.downcase.tr(':','_').concat('.rb')
    end

  end
end


