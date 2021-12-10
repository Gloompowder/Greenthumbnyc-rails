# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'faker'

Garden.destroy_all()
User.destroy_all()
Visit.destroy_all()


client = SODA::Client.new({:domain => "data.cityofnewyork.us", :app_token => ENV["SOCRATA_API_KEY"]})

results = client.get("p78i-pat6", :$limit => 5000)

puts "Got #{results.body.size} results. Dumping first results:"

results.body.each do |result|
    # puts "#{result.to_json()}"
    result_json = JSON.parse(result.to_json())
    # t.string :name
    # t.integer :assemblydist
    # t.string :borough
    # t.integer :communityboard
    # t.integer :congressionaldist
    # t.integer :coundist
    # t.string :juris
    # t.string :parksid
    # t.string :policeprecinct
    # t.string :status
    # t.integer :statesenatedist
    # t.integer :zipcode
    # t.string :openhrssa
    # t.string :openhrssu
    garden_hash = {}
    result_json.each do |k, v| 
        # puts "#{k}: #{v}" 
        garden_hash["#{k}"] = v
        if k === "zipcode" then 
        Garden.find_or_create_by(name: "#{garden_hash["gardenname"]}", assemblydist: "#{garden_hash["assemblydist"]}", borough: "#{garden_hash["borough"]}",
            communityboard: "#{garden_hash["communityboard"]}", congressionaldist: "#{garden_hash["congressionaldist"]}", 
            coundist: "#{garden_hash["coundist"]}", juris: "#{garden_hash["juris"]}", parksid: "#{garden_hash["parksid"]}", 
            policeprecinct: "#{garden_hash["policeprecinct"]}", status: "#{garden_hash["status"]}", statesenatedist: "#{garden_hash["statesenatedist"]}", zipcode: "#{garden_hash["zipcode"]}",
            openhrssa: "#{garden_hash["openhrssa"]}", openhrssu: "#{garden_hash["openhrssu"]}")
        garden_hash = {}
        end
    end
end

def create_20_users
    20.times do 
    firstname = Faker::Name.first_name
    lastname = Faker::Name.last_name
    User.create(firstname: firstname, lastname: lastname, username: Faker::Internet.username(specifier: 8..16), password: Faker::Internet.password(min_length: 10, max_length: 20),
    email: Faker::Internet.email(name: (firstname + " " + lastname), separators: '+'), picture: Faker::Avatar.image, 
    streetnum: "#{Faker::Number.between(from: 1, to: 999)}", apt: Faker::Alphanumeric.alphanumeric(number: 2, min_alpha: 1, min_numeric: 1),
    city: Faker::Address.city, state: Faker::Address.state, country: Faker::Address.country, zipcode: Faker::Address.zip,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 100), gender: Faker::Gender.type, bio: Faker::Hipster.paragraph(sentence_count: rand(1..4)))
    end
end

create_20_users()

def create_50_visits
    50.times do 
    user_id = User.all.sample.id
    garden_id = Garden.all.sample.id
    puts "#{user_id}, #{garden_id}"
    Visit.create(user_id: user_id, garden_id: garden_id)
    end
end

create_50_visits()
puts "Total Gardens: #{Garden.all.count}" + "Total Users: #{User.all.count}" + "Total Visits: #{Visit.all.count}"