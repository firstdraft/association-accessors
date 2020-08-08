require "rails_helper"

RSpec.describe "ideas#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ideas", params: params
  end

  describe "basic fetch" do
    let!(:idea1) { create(:idea) }
    let!(:idea2) { create(:idea) }

    it "works" do
      expect(IdeaResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["ideas"])
      expect(d.map(&:id)).to match_array([idea1.id, idea2.id])
    end
  end
end
