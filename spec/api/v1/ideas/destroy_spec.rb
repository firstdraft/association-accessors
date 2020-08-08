require 'rails_helper'

RSpec.describe "ideas#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/ideas/#{idea.id}"
  end

  describe 'basic destroy' do
    let!(:idea) { create(:idea) }

    it 'updates the resource' do
      expect(IdeaResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Idea.count }.by(-1)
      expect { idea.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
