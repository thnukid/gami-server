#describes the game rules of github push game
module Gami
  class GitPush

    def self.perform_game(for_user)
      game = GamiGame.new("Gives a user badges based on github push events", 'git:push', for_user)

      #apply once the fact
      fact = Fact.aggregate_for_user(for_user,"commit_count",1)

      #run the rules
      game.rule "Welcome on board, #{for_user.username}!", 'newbie' do
        (fact <= 5 && fact < 10)
      end

      game.rule "Houston, we have a ...!", 'rookie' do
        (fact > 5 && fact <= 10)
      end

      game.rule "Look at you, you still see Earth?", 'astronaut' do
        (fact > 10 && fact < 20)
      end

      game.rule "Look at #{for_user.username}, get all the commits", 'superstar' do
        (fact >= 20)
      end

      p game.validate?
      p game.apply
    end
  end
end
