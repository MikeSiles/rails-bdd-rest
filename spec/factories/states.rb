FactoryBot.define do
    factory :state do
        name { Faker::Address.state }
        postal_code { Faker::Address.state_abbr }
        country_id nil
    end
end