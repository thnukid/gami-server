module Gami
  class GamiBadge
    attr_reader :user, :rule
    def initialize(user,rule)
      @user, @rule = user, rule
    end
    def attributes
      {:name => @rule.badge,
       :description => @rule.description,
       :picture => Gami::GamiAssets.new.find_badge(@rule.badge) ,
       :user => @user
      }
    end
  end
end
