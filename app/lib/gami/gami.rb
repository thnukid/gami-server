require_relative('gami_badge')
require_relative('gami_rule')
require_relative('gami_game')
require_relative('gami_engine')
#require_relative('games/git_push')

module Gami
  def self.load?
    self.constants.select {|c| Class === self.const_get(c)}
  end
end
