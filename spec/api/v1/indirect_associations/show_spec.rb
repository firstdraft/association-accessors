require 'rails_helper'

RSpec.describe "indirect_associations#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/indirect_associations/#{indirect_association.id}", params: params
  end

  describe 'basic fetch' do
    let!(:indirect_association) { create(:indirect_association) }

    it 'works' do
      expect(IndirectAssociationResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('indirect_associations')
      expect(d.id).to eq(indirect_association.id)
    end
  end
end
