require 'rails_helper'

RSpec.describe Salesperson, type: :model do
  # Association test
  # Each salesperson is a user
  it { should belong_to(:user)}
  # Each salesperson has personal info
  it { should belong_to(:person)}
  # Each salesperson has a collection of customers
  it { should have_many(:customers)}
end
