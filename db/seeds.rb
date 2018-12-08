require 'json'
require 'open-uri'

url = 'http://localhost:3000/api/v1/users'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

puts "#{user[0]['name']}"
