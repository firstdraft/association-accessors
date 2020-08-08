require 'rails_helper'

RSpec.describe "indirect_associations#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/indirect_associations/#{indirect_association.id}", payload
  end

  describe 'basic update' do
    let!(:indirect_association) { create(:indirect_association) }

    let(:payload) do
      {
        data: {
          id: indirect_association.id.to_s,
          type: 'indirect_associations',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(IndirectAssociationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { indirect_association.reload.attributes }
    end
  end
end
