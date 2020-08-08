require 'rails_helper'

RSpec.describe ModelResource, type: :resource do
  describe 'serialization' do
    let!(:model) { create(:model) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(model.id)
      expect(data.jsonapi_type).to eq('models')
    end
  end

  describe 'filtering' do
    let!(:model1) { create(:model) }
    let!(:model2) { create(:model) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: model2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([model2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:model1) { create(:model) }
      let!(:model2) { create(:model) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            model1.id,
            model2.id
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
            model2.id,
            model1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
