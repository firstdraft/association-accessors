require 'rails_helper'

RSpec.describe 'ideas#show', type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ideas/#{idea.id}", params: params
  end

  describe 'basic fetch' do
    let!(:idea) { create(:idea) }

    it 'works' do
      expect(IdeaResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('ideas')
      expect(d.id).to eq(idea.id)
    end
  end
end
