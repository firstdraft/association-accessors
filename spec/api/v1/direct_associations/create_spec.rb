require "rails_helper"

RSpec.describe "direct_associations#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/direct_associations", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "direct_associations",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(DirectAssociationResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { DirectAssociation.count }.by(1)
    end
  end
end
