require "rails_helper"

RSpec.describe "models#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/models/#{model.id}", params: params
  end

  describe "basic fetch" do
    let!(:model) { create(:model) }

    it "works" do
      expect(ModelResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("models")
      expect(d.id).to eq(model.id)
    end
  end
end
