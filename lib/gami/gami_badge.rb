module Gami
  class GamiBadge
    attr_reader :user, :rule
    def initialize(user,rule)
      @user, @rule = user, rule
    end
    def info
      {:name => @rule.badge, :description => @rule.description, :picture => "http://placekitten.com/g/164/164",:user => @user}
    end
  end
end
