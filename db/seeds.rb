# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'meric', 	email: 'a@a.com', 	password: '1234')
User.create(username: 'atakan',	email: 'b@b.com', 	password: '1234')
User.create(username: 'eren', 	email: 'c@c.com', 	password: '1234')
User.create(username: 'erkan', 	email: 'd@d.com', 	password: '1234')


#Game.create(home: 1, away: 3, winner: 1, loser: 3, draw: false, homegoal: 3, awaygoal: 1)
#Game.create(home: 1, away: 2, winner: 1, loser: 2, draw: false, homegoal: 3, awaygoal: 1)
#Game.create(home: 1, away: 2, winner: 0, loser: 0, draw: true)



teams = ['Galatasaray', 'Besiktas', 'Barcelona', 'Real Madrid', 'Liverpool']

teams.each { |t| Team.create(name: t, added_by: 1) }






p 'Seed complete !'