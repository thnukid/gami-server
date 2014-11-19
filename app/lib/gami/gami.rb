require_relative('gami_badge')
require_relative('gami_rule')
require_relative('gami_predication')
require_relative('gami_game')
require_relative('gami_engine')
require_relative('gami_dsl')
require_relative('gami_assets')

module Gami
  def self.load?
    self.constants.select {|c| Class === self.const_get(c)}
  end
end
