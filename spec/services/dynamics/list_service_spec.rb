require 'rails_helper'

RSpec.describe Dynamics::ListService do
  subject(:service_response) { described_class.call }

  before do
    create_list(:dynamic, 3)
  end

  describe '.call' do
    it 'returns one dynamic' do
      expect(service_response.success?).to be true
      expect(service_response.data.count).to eq(3)
    end
  end
end
