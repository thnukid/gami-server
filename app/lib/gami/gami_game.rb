module Gami
  class GamiGame
    attr_reader :rules, :results

    def initialize(description, event, user)
      @description, @event, @user = description, event, user
      @rules ||= []
      @results ||= []
    end

    def rule(description,badge,&block)
      rules << Gami::Rule.new(description,badge,&block)
    end

    def validate?
      rules.each do |a_rule|
          results << Gami::GamiBadge.new(@user,a_rule) if a_rule.applies?
      end
    end

    def apply
      results.each do |badge|
        Badge.create badge.attributes
      end
    end
  end

end
