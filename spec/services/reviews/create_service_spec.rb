require 'rails_helper'

RSpec.describe Reviews::CreateService do
  subject(:service_response) { described_class.call(**params) }

  let!(:dynamic) { create(:dynamic) }
  let(:params) { { dynamic_id: dynamic.id, params: { comment: 'Nice!', rating: 5 } } }

  describe '.call' do

    context 'with valid params' do
      it 'creates a review' do
        expect(service_response.success?).to be true
        expect(service_response.data).to be_persisted
      end
    end

    context 'with invalid params' do
      let(:params) { { dynamic_id: nil, params: { comment: '', rating: nil }} }

      it 'returns failure' do
        expect(service_response.success?).to be false
        expect(service_response.data).to eq('Dinamica não econtrada')
      end
    end
  end
end
