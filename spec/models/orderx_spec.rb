require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Orderx, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should belong_to(:userx) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:imei) }
  it { should validate_presence_of(:annual_price) }
end
