# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new
admin.email = 'admin@example.com'
admin.password = 'qwerty2016'
admin.password_confirmation = 'qwerty2016'
admin.save!
admin.add_role(:admin)

organizer_1 = User.new
organizer_1.email = 'organizer_1@example.com'
organizer_1.password = 'qwerty2016'
organizer_1.password_confirmation = 'qwerty2016'
organizer_1.save!
organizer_1.add_role(:organizer)

organizer_2 = User.new
organizer_2.email = 'organizer_2@example.com'
organizer_2.password = 'qwerty2016'
organizer_2.password_confirmation = 'qwerty2016'
organizer_2.save!
organizer_2.add_role(:organizer)