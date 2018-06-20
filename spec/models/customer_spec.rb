require 'rails_helper'

RSpec.describe Customer, type: :model do
    # Association tests
  # Any type of table that gets multiple emails goes here
  it { should have_and_belong_to_many(:emails)}
  it { should have_and_belong_to_many(:phones)}
  it { should have_and_belong_to_many(:people)}

  # Each customer belongs to one salesperson
  it { should belong_to(:salesperson) }

  # Validation test
  # We only need a name for a customer, everything else is optional
  it { should validate_presence_of(:name) }
end