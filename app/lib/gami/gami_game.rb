module Gami
  class GamiGame
    attr_reader :rules, :results, :description, :event, :user

    def initialize(description, event, user)
      @description, @event, @user = description, event, user
      @rules ||= []
      @results ||= []
    end

    def run
      validate_rules
      apply_badges
    end

    def properties
      @rules.map(&:property).uniq
    end

    def add_rule(description,badge, property, &block)
      rules << Gami::Rule.new(description,badge,property, &block)
    end

    def validate_rules
      rules.each do |a_rule|
          results << Gami::GamiBadge.new(@user,a_rule) if a_rule.applies?
      end
    end

    def apply_badges
      results.each do |badge|
        Badge.create badge.attributes
      end
    end
  end
end
