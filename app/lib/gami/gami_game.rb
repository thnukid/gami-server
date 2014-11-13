module Gami
  class GamiGame
    attr_reader :rules, :results, :description, :event

    def initialize(description, event)
      @description, @event = description, event
      @rules ||= []
      @results ||= []
    end

    def run(event)
      @event = event
      validate_rules
      apply_badges
    end

    def properties
      @rules.map(&:property).uniq
    end

    def add_rule(description,badge, property, conditions, &block)
      rules << Gami::Rule.new(description,badge,property, conditions, &block)
    end

    def validate_rules
      rules.each do |a_rule|
        results << Gami::GamiBadge.new(event.user,a_rule) if a_rule.applies?(event.user)
      end
    end

    def apply_badges
      results.each do |badge|
        Badge.where(badge.attributes).first_or_create
      end
    end
  end
end
