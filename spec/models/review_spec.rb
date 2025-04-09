require 'rails_helper'


RSpec.describe Review, type: :model do
  describe 'associations' do
    it { should belong_to(:dynamic) }
  end

  describe 'validations' do
    it { should validate_presence_of(:comment) }
    it { should validate_presence_of(:rating) }
    it { should validate_inclusion_of(:rating).in_range(1..5) }
  end
end
