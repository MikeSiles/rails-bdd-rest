FactoryBot.define do
    factory :user do
        name { Faker::Name.name }
        email 'foo@bar.com'
        password 'foobar'
        salesperson_id nil
    end
end