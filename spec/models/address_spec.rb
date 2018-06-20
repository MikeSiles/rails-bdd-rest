require 'rails_helper'

RSpec.describe Address, type: :model do
  # Association tests
  # Customers and people can have multiple addresses, or share them
  it { should have_and_belong_to_many(:customers)}
  it { should have_and_belong_to_many(:people)}
  # Test for validation
  it { should validate_presence_of(:line_1) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:country) }
end
