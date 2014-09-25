#describes the game rules of github push game
module Gami
class GitCommit

  def self.perform_game(for_user)
    game = GamiGame.new("Gives a user badges based on github push events", 'git:commit', for_user)

    game.rule "Welcome on board, #{for_user.username}!", 'newbie' do
     fact =  Fact.aggregate_for_user(for_user,"commit_count",1)
     fact.value <= 5
    end

    game.rule "Houston, we have a ...!", 'rookie' do
     fact = Fact.aggregate_for_user(for_user,"commit_count",1)
     fact.value <= 10
    end

    game.rule "Look at you, you still see Earth?", 'astronaut' do
      fact = Fact.aggregate_for_user(for_user,"commit_count",1)
      fact.value <= 20
    end

    p game.validate?
    p game.apply
  end
end
end
