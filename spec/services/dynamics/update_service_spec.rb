# spec/services/dynamics/update_service_spec.rb
require 'rails_helper'

RSpec.describe Dynamics::UpdateService do
  subject(:service_response) { described_class.call(**params) }
  let(:params) { { id: dynamic.id } }
  let!(:dynamic) { create(:dynamic, name: 'Old Name', description: 'Old desc') }

  describe '.call' do
    context 'with valid params' do
      let(:params) do
        {
          id: dynamic.id,
          name: 'Updated Name',
          description: 'New description'
        }
      end

      it 'updates the dynamic' do
        expect(service_response.success?).to be true
        expect(service_response.data.name).to eq('Updated Name')
      end
    end

    context 'with nested review updates' do
      let!(:review) { create(:review, dynamic: dynamic, comment: 'Initial', rating: 2) }

      let(:params) do
        {
          id: dynamic.id,
          reviews_attributes: [
            { id: review.id, comment: 'Updated Comment', rating: 5 }
          ]
        }
      end

      it 'updates the review' do
        expect(service_response.success?).to be true
        expect(service_response.data.reviews.first.comment).to eq('Updated Comment')
        expect(service_response.data.reviews.first.rating).to eq(5)
      end
    end

    context 'when dynamic not found' do
      let(:params) { { id: 0, name: 'New Name' } }

      it 'returns failure' do
        expect(service_response.success?).to be false
        expect(service_response.data).to eq('Dinamica não econtrada')
      end
    end
  end
end
