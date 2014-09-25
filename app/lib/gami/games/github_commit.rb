#describes the game rules of github push game
module Gami
class GitCommit

  def self.perform_game(for_user)
    game = GamiGame.new("Gives a user badges based on github push events", 'git:commit', for_user)

    game.rule "Welcome on board!", 'newbie' do
      true
    end

    game.rule "on board!", 'newbie' do
      false
    end
    p game.validate?
    p game.apply
  end
end
end
