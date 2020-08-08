require 'rails_helper'

RSpec.describe "direct_associations#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/direct_associations/#{direct_association.id}"
  end

  describe 'basic destroy' do
    let!(:direct_association) { create(:direct_association) }

    it 'updates the resource' do
      expect(DirectAssociationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { DirectAssociation.count }.by(-1)
      expect { direct_association.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
