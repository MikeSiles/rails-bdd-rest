FactoryBot.define do
    factory :phone do
        Faker::Config.locale = 'en-US'
        number { Faker::PhoneNumber.phone_number }
        extension { Faker::PhoneNumber.extension }
    end
end