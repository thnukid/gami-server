# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
#Add 2 users

u_musterman = User.create(username: 'Hans Mustermann', email: 'h.mustermann@localho.st', password_digest: '1234')
u_musterfrau = User.create(username: 'Angi Musterfrau', email: 'a.musterfrau@localho.st', password_digest: '1234')

u_musterman.aliases.create(username: 'Hans Github', email: 'h.mustermann@githo.st')
u_musterman.aliases.create(username: 'Hans Codeclimate', email: 'h.mustermann@code.st')

u_musterfrau.aliases.create(username: 'Angi Github', email: 'a.musterfrau@githo.st')
u_musterfrau.aliases.create(username: 'Angi Codeclimate', email: 'a.musterfrau@code.st')

##badges
u_musterman.badges.create(name: 'Noob', description: 'One day baby, you be not a noob anymore', picture: 'badges/noob.png')
u_musterfrau.badges.create(name: 'Noob', description: 'One day baby, you be not a noob anymore', picture: 'badges/noob.png')

u_musterman.badges.create(name: 'Intern', description: 'Get some coffee, will you?', picture: 'badges/intern.png')
u_musterfrau.badges.create(name: 'Expert', description: 'You made it!', picture: 'badges/expert.png')

##some events
u_musterman.events.create(name: 'git:commit', data: '"lines":[{added: 100, removed: 100}]')
u_musterfrau.events.create(name: 'git:commit', data: '"lines":[{added: 50, removed: 50}]')

u_musterman.events.create(name: 'git:commit', data: '"lines":[{added: 100, removed: 100}]')
u_musterfrau.events.create(name: 'git:commit', data: '"lines":[{added: 50, removed: 50}]')

u_musterman.events.create(name: 'codeclimate:gpa', data: '"gpa":[{current: 2.99, before: 2.55}]')
u_musterfrau.events.create(name: 'codeclimate:gpa', data: '"gpa":[{current: 3.99, before: 3.55}]')

##add facts\
u_musterman.facts.create(aggregated_fact_name: "commit_count", value: 1 )
u_musterfrau.facts.create(aggregated_fact_name: "commit_count", value: 1 )

u_musterman.facts.create(aggregated_fact_name: "push_count", value: 1 )
u_musterfrau.facts.create(aggregated_fact_name: "push_count", value: 1 )
