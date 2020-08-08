require "rails_helper"

RSpec.describe "direct_associations#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/direct_associations/#{direct_association.id}", params: params
  end

  describe "basic fetch" do
    let!(:direct_association) { create(:direct_association) }

    it "works" do
      expect(DirectAssociationResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("direct_associations")
      expect(d.id).to eq(direct_association.id)
    end
  end
end
