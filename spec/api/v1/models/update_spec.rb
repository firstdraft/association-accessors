require 'rails_helper'

RSpec.describe 'models#update', type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/models/#{model.id}", payload
  end

  describe 'basic update' do
    let!(:model) { create(:model) }

    let(:payload) do
      {
        data: {
          id: model.id.to_s,
          type: 'models',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ModelResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { model.reload.attributes }
    end
  end
end
