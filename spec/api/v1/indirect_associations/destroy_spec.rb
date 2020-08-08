require 'rails_helper'

RSpec.describe "indirect_associations#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/indirect_associations/#{indirect_association.id}"
  end

  describe 'basic destroy' do
    let!(:indirect_association) { create(:indirect_association) }

    it 'updates the resource' do
      expect(IndirectAssociationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { IndirectAssociation.count }.by(-1)
      expect { indirect_association.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
