require "rails_helper"

RSpec.describe "direct_associations#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/direct_associations", params: params
  end

  describe "basic fetch" do
    let!(:direct_association1) { create(:direct_association) }
    let!(:direct_association2) { create(:direct_association) }

    it "works" do
      expect(DirectAssociationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["direct_associations"])
      expect(d.map(&:id)).to match_array([direct_association1.id, direct_association2.id])
    end
  end
end
