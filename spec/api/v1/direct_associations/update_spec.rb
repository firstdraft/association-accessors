require "rails_helper"

RSpec.describe "direct_associations#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/direct_associations/#{direct_association.id}", payload
  end

  describe "basic update" do
    let!(:direct_association) { create(:direct_association) }

    let(:payload) do
      {
        data: {
          id: direct_association.id.to_s,
          type: "direct_associations",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(DirectAssociationResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { direct_association.reload.attributes }
    end
  end
end
