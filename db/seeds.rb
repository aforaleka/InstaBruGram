# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Comment.delete_all
Photo.delete_all
User.delete_all

"creating users"

User.create! email: "aleka@c.com", password: "password", password_confirmation: "password"
User.create! email: "chen@lu.com", password: "iloveyou", password_confirmation: "iloveyou"


"creating photos"
    
Photo.create! public: true, caption: "Which way to go?", image: "https://scontent-lhr3-1.cdninstagram.com/hphotos-xpa1/t51.2885-15/10914662_1546507308935255_192965613_n.jpg", likes: 200, user: User.first
Photo.create! public: true, caption: "Cotton Candy", image: "https://igcdn-photos-c-a.akamaihd.net/hphotos-ak-xfa1/t51.2885-15/10838818_1520953218175914_379951357_n.jpg", likes: 100, user: User.first
Photo.create! public: true, caption: "My favorite person <3", image: "https://igcdn-photos-h-a.akamaihd.net/hphotos-ak-xta1/t51.2885-15/11142268_1419160948391823_948056689_n.jpg", likes: 1314, user: User.first
Photo.create! public: true, caption: "throw back to last northwestern winters", image: "https://igcdn-photos-c-a.akamaihd.net/hphotos-ak-xfp1/t51.2885-15/10953654_577968925671082_530245940_n.jpg", likes: 200, user: User.first
Photo.create! public: true, caption: "Sunset --- ", image: "https://igcdn-photos-h-a.akamaihd.net/hphotos-ak-xpf1/t51.2885-15/10946603_355361241339399_772692939_n.jpg", likes: 300, user: User.first
Photo.create! public: true, caption: "Cape Town! Taken @Lion's Head", image: "https://igcdn-photos-e-a.akamaihd.net/hphotos-ak-xaf1/t51.2885-15/11378956_103164070031836_622338598_n.jpg", likes: 200, user: User.first
Photo.create! public: true, caption: "Boerie sliders!", image: "https://igcdn-photos-g-a.akamaihd.net/hphotos-ak-xfa1/t51.2885-15/11380856_919226154780270_328688278_n.jpg", likes: 100, user: User.first