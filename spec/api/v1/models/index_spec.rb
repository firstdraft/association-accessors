require 'rails_helper'

RSpec.describe 'models#index', type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get '/api/v1/models', params: params
  end

  describe 'basic fetch' do
    let!(:model1) { create(:model) }
    let!(:model2) { create(:model) }

    it 'works' do
      expect(ModelResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['models'])
      expect(d.map(&:id)).to match_array([model1.id, model2.id])
    end
  end
end
