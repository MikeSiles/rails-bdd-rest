require 'rails_helper'

RSpec.describe Phone, type: :model do
  # Association tests
  # Any type of table that gets multiple emails goes here
  it { should have_and_belong_to_many(:customers)}
  it { should have_and_belong_to_many(:people)}
  # Validation test
  # Only a number is necessary
  it { should validate_presence_of(:number) }
end
