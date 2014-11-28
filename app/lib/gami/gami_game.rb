module Gami
  class GamiGame
    attr_reader :rules, :results, :next_badges, :description, :event, :options

    def initialize(description, event, options = {})
      @description, @event = description, event
      @options = options 
      @rules ||= []
      @results ||= []
      @next_badges ||= []
    end

    def run(event)
      @event = event #event was an string, but from this point is the event model itself
      validate_rules
      apply_badges
    end

    def add_rule(description,badge, property, conditions, &block)
      rules << Gami::Rule.new(description,badge,property, conditions, &block)
    end

    #returns all properties on the rules
    #get called by the engine to aggregate all properties
    #contained in the rules
    def properties
      @rules.map(&:property).uniq
    end

    private
    def validate_rules
      rules.each do |a_rule|
        if a_rule.applies?(event.user)
          results << Gami::GamiBadge.new(event.user,a_rule)
        else
          next_badges << Gami::GamiBadge.new(event.user,a_rule)
        end
      end
    end

    def apply_badges
      results.each do |badge|
        Badge.where(badge.attributes).first_or_create
      end
    end
  end
end
