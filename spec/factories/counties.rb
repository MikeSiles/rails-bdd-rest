FactoryBot.define do
    factory :county do
        name { Faker::Address.city_prefix }
        state_id nil
    end
end