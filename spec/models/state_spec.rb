require 'rails_helper'

RSpec.describe State, type: :model do
    # Association test
  # ensure an item record belongs to a single country record
  it { should belong_to(:country) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:postal_code) }
end
