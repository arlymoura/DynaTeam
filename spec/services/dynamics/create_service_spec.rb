# spec/services/dynamics/create_service_spec.rb
require 'rails_helper'

RSpec.describe Dynamics::CreateService do
  subject(:service_response) { described_class.call(**params) }

  let(:params) { {} }

  describe '.call' do
    context 'with valid params' do
      let(:params) do
        {
          name: 'Team Building',
          description: 'Improve teamwork'
        }
      end

      it 'creates a dynamic' do
        expect(service_response.success?).to be true
        expect(service_response.data).to be_persisted
        expect(service_response.data.name).to eq('Team Building')
      end
    end

    context 'with nested review params' do
      let(:params) do
        {
          name: 'Feedback Session',
          description: 'Team feedback',
          reviews_attributes: [
            { comment: 'Great dynamic!', rating: 5 },
            { comment: 'Needs improvement', rating: 3 }
          ]
        }
      end

      it 'creates a dynamic with reviews' do
        expect(service_response.success?).to be true
        expect(service_response.data.reviews.count).to eq(2)
        expect(service_response.data.reviews.first.comment).to eq('Great dynamic!')
      end
    end

    context 'with invalid params' do
      let(:params) { { name: '' } }

      it 'returns failure' do
        expect(service_response.success?).to be false
        expect(service_response.data).to be_present
      end
    end
  end
end
