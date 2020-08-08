require "rails_helper"

RSpec.describe IdeaResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "ideas",
          attributes: {},
        },
      }
    end

    let(:instance) do
      IdeaResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      end.to change { Idea.count }.by(1)
    end
  end

  describe "updating" do
    let!(:idea) { create(:idea) }

    let(:payload) do
      {
        data: {
          id: idea.id.to_s,
          type: "ideas",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      IdeaResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { idea.reload.updated_at }
      # .and change { idea.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:idea) { create(:idea) }

    let(:instance) do
      IdeaResource.find(id: idea.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Idea.count }.by(-1)
    end
  end
end
