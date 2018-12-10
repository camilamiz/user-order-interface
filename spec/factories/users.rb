FactoryBot.define do
  factory :user do
    name { Faker::Lorem.word }
    cpf { Faker::Number.number(11) }
    email { Faker::Internet.email }
  end
end
