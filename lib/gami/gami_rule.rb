module Gami
  class Rule
    attr_reader :description, :badge, :block

    def initialize(description, badge, &block)
      @description = description
      @badge = badge
      @block = block
    end

    def applies?
      is_true = true
      unless self.block.nil?
        is_true = self.block.call
      end
    end
  end
end
