require 'rails_helper'

RSpec.describe Person, type: :model do
    # Association tests
  # Because people may share phones/emails they are m2m
  # A person can also be listed under multiple customers
  it { should have_and_belong_to_many(:emails)}
  it { should have_and_belong_to_many(:phones)}
  it { should have_and_belong_to_many(:customers)}

  # Validation test
  # We only need a last name for a person, everything else is optional
  it { should validate_presence_of(:last_name) }
end
