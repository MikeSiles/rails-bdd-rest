FactoryBot.define do
    factory :zip do
        code { Faker::Address.zip }
        state_id nil
    end
end