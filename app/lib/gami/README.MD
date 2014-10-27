#Gamification - Toolset
##DSL Syntax
~~~
MakeGame.for "Commiting to a Github repository" do
  when "git:push" do
    #named paramaters in ruby - hash - named keyword argument
    receive_badge "Boarding", with_label: "Welcome, to the crew! ", using_property: "commit" , when_equal_count: 1
    receive_badge "Intern", "You slowly getting accquainted with the code.", 10
    receive_badge "Apprenticeships", "You making progress. Diving into the codebase.",20
    receive_badge "Junior", "Way to go! You are contributing to the team effort.", 30
    receive_badge "Senior", "You became a core member of the team, congratulations", 40
    receive_badge "PwnAge", "Code becomes you, you becomes code", 50
  end
end

class DSL
y
end






//
badge_assets{
"Boarding"        : "bBoarding.png",
"Intern"          : "Intern.png",
"Apprenticeships" : "bApprentice.png",
"Junior"          : "bJunior.png",
"Senior"          : "bSenior.png",
"PwnAge"          : "bPwnAge.png",
"Boarding"        : "bBoarding.png",
}
##Naming conventions
