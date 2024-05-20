# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'
1.times.each do
  user = FactoryBot.create(:user)
  article = FactoryBot.create(:article, user: user)
  social_profile = FactoryBot.create(:social_profile, user: user)
  FactoryBot.create(:comment, user: user, article: article)
end