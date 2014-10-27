#named paramaters in ruby - hash - named keyword argument
a = CreateGame.define do
  receive_badge "Boarding", with_label: "Welcome, to the crew! ", using_property: "commit" , lteq: 1
  receive_badge "Intern", with_label: "You slowly getting accquainted with the code.", using_property: 'commit', lteq: 10
  receive_badge "Apprenticeships", with_label: "You making progress. Diving into the codebase.", using_property: 'commit', lteq: 20
  receive_badge "Junior", with_label: "Way to go! You are contributing to the team effort.", using_property: 'commit', lteq: 30
  receive_badge "Senior", with_label: "You became a core member of the team, congratulations", using_property: 'commit', lteq: 40
  receive_badge "PwnAge", with_label: "Code becomes you, you becomes code", using_property: 'commit', lteq: 50
end
puts a.inspect
