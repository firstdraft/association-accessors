require 'rails_helper'

RSpec.describe 'ideas#create', type: :request do
  subject(:make_request) do
    jsonapi_post '/api/v1/ideas', payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'ideas',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(IdeaResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { Idea.count }.by(1)
    end
  end
end
