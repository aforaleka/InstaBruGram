# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Photo.delete_all
User.delete_all

"creating users"

User.create! email: "aforaleka@gmail.com", password: "password", password_confirmation: "password"
User.create! email: "chen@lu.com", password: "iloveyou", password_confirmation: "iloveyou"



"creating photos"

    # t.boolean  "public"
    # t.text     "caption"
    # t.string   "image"
    # t.integer  "likes",      default: 0
    # t.datetime "created_at",             null: false
    # t.datetime "updated_at",             null: false
    # t.integer  "user_id"
Photo.create! public: true, caption: "Boerie sliders <333", image: "https://igcdn-photos-g-a.akamaihd.net/hphotos-ak-xfa1/t51.2885-15/11380856_919226154780270_328688278_n.jpg", likes: 100, user: User.first
