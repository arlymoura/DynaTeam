require 'rails_helper'

RSpec.describe Dynamics::ShowService do
  subject(:service_response) { described_class.call(**params) }

  let(:dynamic) { create(:dynamic) }
  let(:params) { { id: dynamic.id } }

  before do
    create_list(:dynamic, 3)
  end


  describe '.call' do
    context 'when dynamic exists' do
      it 'returns all dynamics' do
        expect(service_response.success?).to be true
        expect(service_response.data.id).to eq(dynamic.id)
      end
    end

    context 'when dynamic does not exist' do
      let(:params) { { id: 9999 } }

      it 'returns an error' do
        expect(service_response.success?).to be false
        expect(service_response.data).to eq('Dinamica não econtrada')
      end
    end

    context 'when dynamic is not found' do
      let(:params) { { id: nil } }

      it 'returns an error' do
        expect(service_response.success?).to be false
        expect(service_response.data).to eq('Dinamica não econtrada')
      end
    end
  end
end
