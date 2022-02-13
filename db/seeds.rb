# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: 'admin@ses.com', role: 'ADMIN', password_digest: BCrypt::Password.create('admin'))
Admin.create(name: 'Admin', user_email: 'admin@ses.com', phone: 9191919191, password_digest: BCrypt::Password.create('admin'))