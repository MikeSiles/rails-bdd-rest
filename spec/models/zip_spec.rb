require 'rails_helper'

RSpec.describe Zip, type: :model do
    # Association test
  # ensure an item record belongs to a single state record
  it { should belong_to(:state) }
  # Validation test
  # ensure the zip has a code before saving
  it { should validate_presence_of(:code) }
end
