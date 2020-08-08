require 'rails_helper'

RSpec.describe IdeaResource, type: :resource do
  describe 'serialization' do
    let!(:idea) { create(:idea) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(idea.id)
      expect(data.jsonapi_type).to eq('ideas')
    end
  end

  describe 'filtering' do
    let!(:idea1) { create(:idea) }
    let!(:idea2) { create(:idea) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: idea2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([idea2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:idea1) { create(:idea) }
      let!(:idea2) { create(:idea) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            idea1.id,
            idea2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            idea2.id,
            idea1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
