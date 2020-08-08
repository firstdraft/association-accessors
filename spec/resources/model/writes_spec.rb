require 'rails_helper'

RSpec.describe ModelResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'models',
          attributes: {}
        }
      }
    end

    let(:instance) do
      ModelResource.build(payload)
    end

    it 'works' do
      expect do
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      end.to change { Model.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:model) { create(:model) }

    let(:payload) do
      {
        data: {
          id: model.id.to_s,
          type: 'models',
          attributes: {} # Todo!
        }
      }
    end

    let(:instance) do
      ModelResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { model.reload.updated_at }
      # .and change { model.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:model) { create(:model) }

    let(:instance) do
      ModelResource.find(id: model.id)
    end

    it 'works' do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Model.count }.by(-1)
    end
  end
end
