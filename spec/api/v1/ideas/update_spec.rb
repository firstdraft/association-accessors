require 'rails_helper'

RSpec.describe "ideas#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/ideas/#{idea.id}", payload
  end

  describe 'basic update' do
    let!(:idea) { create(:idea) }

    let(:payload) do
      {
        data: {
          id: idea.id.to_s,
          type: 'ideas',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(IdeaResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { idea.reload.attributes }
    end
  end
end
