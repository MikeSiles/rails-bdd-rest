require 'rails_helper'

RSpec.describe County, type: :model do
    # Association test
  # ensure an item record belongs to a single state record
  it { should belong_to(:state) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end
