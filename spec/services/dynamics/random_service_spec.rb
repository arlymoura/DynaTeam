require 'rails_helper'

RSpec.describe Dynamics::RandomService do
  subject(:service_response) { described_class.call }

  before do
    create_list(:dynamic, 10)
  end

  describe '.call' do
    context 'when there are dynamics' do
      it 'returns all dynamics' do
        expect(service_response.success?).to be true
        expect(service_response.data).to be_a(Dynamic)
        expect(service_response.data).to be_present
        expect(service_response.data).to be_a_kind_of(Dynamic)
      end
    end

    context 'when there are no dynamics' do
      before do
        Dynamic.delete_all
      end

      it 'returns an error' do
        expect(service_response.success?).to be false
        expect(service_response.data).to eq('Nenhuma dinamica cadastrada')
      end
    end
  end
end
