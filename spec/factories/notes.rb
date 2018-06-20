FactoryBot.define do
    factory :note do
        title { Faker::FamilyGuy.character }
        content { Faker::FamilyGuy.quote }
    end
end