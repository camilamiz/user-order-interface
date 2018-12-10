require 'json'
require 'open-uri'


puts "Parse users..."

url = 'http://localhost:3000/api/v1/users'
users_serialized = open(url).read
users = JSON.parse(users_serialized)

users.each do |user|
  Userx.create!(name: user['name'], cpf: user['cpf'], email: user['email'])
end

puts "Finished parsing users!"


puts "Parse orders..."

user_id = Userx.pluck(:id)

user_id.each do |id|
  url = "http://localhost:3000/api/v1/users/#{id}"
  orders_serialized = open(url).read
  orders = JSON.parse(orders_serialized)
  if orders['comments'][0].nil?
  else
    orders['comments'].each_with_index do |order, index|
      Orderx.create!(
        model: orders['comments'][index]['model'],
        imei: orders['comments'][index]['imei'],
        annual_price: orders['comments'][index]['annual_price'],
        number_of_installments: orders['comments'][index]['number_of_installments'],
        user_id: orders['comments'][index]['user_id'])
    end
  end
end

puts "Finished parsing users!"
