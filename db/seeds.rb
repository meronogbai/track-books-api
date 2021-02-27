# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: 'test_user', password: '123456')
user.books.create(title: 'Comedy Book', total_chapters: 50, completed_chapters: 2)
user.books.create(title: 'Sad Book', total_chapters: 100, completed_chapters: 25)