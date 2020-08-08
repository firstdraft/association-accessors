require "rails_helper"

RSpec.describe "models#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/models/#{model.id}"
  end

  describe "basic destroy" do
    let!(:model) { create(:model) }

    it "updates the resource" do
      expect(ModelResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Model.count }.by(-1)
      expect { model.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
