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

    def on_event(event)
      @game_config[:event] =  event
      @game = Gami::GamiGame.new(@game_config[:description], @game_config[:event], "user")
      yield
      @game
    end

    def receive_badge(name, options = {})
      label = options[:with_label]
      property = options[:using_property]
      block = Gami::Predication.new.build(options)

      #attach the rule to the game
      @game.add_rule(label, name, property , &block)
    end


    def print2
      game.validate?
      game.results.each do |b|
        puts b.inspect
      end
      #puts @game.inspect
    end
  end
end
