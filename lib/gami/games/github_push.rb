#describes the game rules of github push game

game = GamiGame.new("Gives a user badges based on github push events", 'git:commit', 'user')

game.rule "Welcome on board!", 'newbie' do
  true
end

game.rule "on board!", 'newbie' do
  false
end
