FactoryBot.define do
  factory :order do
    model { Faker::StarWars.character }
    imei { Faker::Number.number(5) }
    annual_price rand(100.00..10_000.00)
    number_of_installments rand(1..24)
    user_id nil
  end
end
