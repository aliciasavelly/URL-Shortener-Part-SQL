# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

v1 = Visit.create!(user_id: 1, short_url_id: 1)
v2 = Visit.create!(user_id: 1, short_url_id: 2)
v3 = Visit.create!(user_id: 1, short_url_id: 3)
v4 = Visit.create!(user_id: 2, short_url_id: 3)
v5 = Visit.create!(user_id: 2, short_url_id: 3)
v6 = Visit.create!(user_id: 2, short_url_id: 4)
v7 = Visit.create!(user_id: 3, short_url_id: 2)
v8 = Visit.create!(user_id: 3, short_url_id: 1)
v9 = Visit.create!(user_id: 5, short_url_id: 8)
