require 'rails_helper'

RSpec.describe Country, type: :model do
  # Association test
  # ensure that Country has a 1:m relationship with State
  it { should have_many(:states).dependent(:destroy) }
  # Test for validation
  # ensure that the name is present when a country is added
  it { should validate_presence_of(:name) }
end
