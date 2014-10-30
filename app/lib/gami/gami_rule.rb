module Gami
  class Rule
    attr_reader :description, :badge, :block, :property

    def initialize(description, badge, property, &block)
      @description = description
      @badge = badge
      @property = property
      @block = block

    end

    def applies?
      #no block given: will always be true
      no_block_or_true = true
      unless self.block.nil?
        called = self.block.call
        #True Class case
        if called.kind_of?(TrueClass) || called.kind_of?(FalseClass)
          no_block_or_true = called
        end
      end
      no_block_or_true
    end
  end
end
