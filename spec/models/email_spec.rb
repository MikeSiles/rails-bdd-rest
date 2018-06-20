require 'rails_helper'

RSpec.describe Email, type: :model do
  # Association tests
  # Any type of table that gets multiple emails goes here
  it { should have_and_belong_to_many(:customers)}
  it { should have_and_belong_to_many(:people)}
  # Validation test
  # We only need the actual address, everything else is optional
  it { should validate_presence_of(:address) }
end
