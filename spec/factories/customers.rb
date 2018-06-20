FactoryBot.define do
    factory :customer do
        name { Faker::Simpsons.location }
        salesperson_id nil
    end
end