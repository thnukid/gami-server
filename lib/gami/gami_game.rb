module Gami
  class GamiGame
    attr_reader :rules

    def initialize(description, event, user)
      @description, @event, @user = description, event, user
      @rules ||= []
    end

    def rule(description,badge,&block)
      rules << Gami::Rule.new(description,badge,&block)
    end

    def validate?
      rules.each do |a_rule|
        applyBadge(a_rule) if a_rule.applies?
      end
    end

    private
    def applyBadge(rule)
      Badge.create(:name => rule.badge, :description => rule.description, :picture => "http://placekitten.com/g/164/164",:user => user)
    end

  end
end
