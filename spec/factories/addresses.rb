FactoryBot.define do
    factory :address do
        name { Faker::GameOfThrones.house }
        first_line { Faker::Address.street_address }
        second_line { Faker::Address.secondary_address }
        city { Faker::GameOfThrones.city }
        state_id nil
        county_id nil
        zip_id nil
        country_id nil
    end
end