require 'rails_helper'

RSpec.describe Dynamic, type: :model do
  describe 'associations' do
    it { should have_many(:reviews).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end
end
