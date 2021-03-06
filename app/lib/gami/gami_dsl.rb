module Game
  def self.define(description, &block)
    dsl_instance = Gami::GamiDSL.new description
    dsl_instance.instance_eval(&block)
  end
end

module Gami
  class GamiDSL
    attr_accessor :game_config, :game

    def initialize(description)
      @game_config = {:description => description}
    end

      #set event name as string
    def on_event(event)
      @game_config[:event] =  event
      #create a new Game
      @game = Gami::GamiGame.new(@game_config[:description], @game_config[:event])
      #execute rest of the dsl
      yield
      #return game
      @game
    end

    def receive_badge(name, options = {})
      label = options[:with_label]
      property = options[:using_property]
      block = Gami::Predication.new.build(options)

      #attach the rule to the game
      @game.add_rule(label, name, property, options, &block)
    end
  end
end
