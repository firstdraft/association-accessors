require "rails_helper"

RSpec.describe DirectAssociationResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "direct_associations",
          attributes: {},
        },
      }
    end

    let(:instance) do
      DirectAssociationResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      end.to change { DirectAssociation.count }.by(1)
    end
  end

  describe "updating" do
    let!(:direct_association) { create(:direct_association) }

    let(:payload) do
      {
        data: {
          id: direct_association.id.to_s,
          type: "direct_associations",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      DirectAssociationResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { direct_association.reload.updated_at }
      # .and change { direct_association.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:direct_association) { create(:direct_association) }

    let(:instance) do
      DirectAssociationResource.find(id: direct_association.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { DirectAssociation.count }.by(-1)
    end
  end
end
