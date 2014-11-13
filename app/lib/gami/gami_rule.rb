module Gami
  class Rule
    attr_reader :description, :badge, :block, :property, :conditions

    def initialize(description, badge, property, conditions, &block)
      @description = description
      @badge = badge
      @property = property
      @block = block
      @conditions = conditions
    end

    def applies?(user)
      fact_value = Fact.where(aggregated_fact_name: property, user: user).first.try(:value)
      return false if fact_value.nil?
      no_block_or_true = true
      unless self.block.nil?
        called = self.block.call(fact_value)
        if called.kind_of?(TrueClass) || called.kind_of?(FalseClass)
          no_block_or_true = called
        end
      end
      no_block_or_true
    end

  end
end
