# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
  [
    {
      email: 'karimen@karimen.com',
      password: 'karimen',
      first_name: 'karimen',
      last_name: '太郎',
      first_name_kata: 'カリメン',
      last_name_kata: 'タロウ',
      nickname:  'kari',
      num_of_exihibits: 1,
      phone_number: '0966611111',
      post_code: '1111111',
      prefecture: '東京都',
      city_village_town: '渋谷区',
      house_number: '3丁目',
      building: '1番地',
      birthday: '1986-11-02'
    }
  ]
)
user.save!

if Rails.env == "development"
  10.times do |i|
    Product.create!(
      name: "ほげほげ#{i + 1}",
      price: 8600,
      size: 25,
      condition: "きれい"
    )
  end
end
