require 'rails_helper'

RSpec.describe "indirect_associations#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/indirect_associations", params: params
  end

  describe 'basic fetch' do
    let!(:indirect_association1) { create(:indirect_association) }
    let!(:indirect_association2) { create(:indirect_association) }

    it 'works' do
      expect(IndirectAssociationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['indirect_associations'])
      expect(d.map(&:id)).to match_array([indirect_association1.id, indirect_association2.id])
    end
  end
end
