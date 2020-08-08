require 'rails_helper'

RSpec.describe IndirectAssociationResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'indirect_associations',
          attributes: { }
        }
      }
    end

    let(:instance) do
      IndirectAssociationResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { IndirectAssociation.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:indirect_association) { create(:indirect_association) }

    let(:payload) do
      {
        data: {
          id: indirect_association.id.to_s,
          type: 'indirect_associations',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      IndirectAssociationResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { indirect_association.reload.updated_at }
      # .and change { indirect_association.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:indirect_association) { create(:indirect_association) }

    let(:instance) do
      IndirectAssociationResource.find(id: indirect_association.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { IndirectAssociation.count }.by(-1)
    end
  end
end
