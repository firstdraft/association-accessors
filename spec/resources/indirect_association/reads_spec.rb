require "rails_helper"

RSpec.describe IndirectAssociationResource, type: :resource do
  describe "serialization" do
    let!(:indirect_association) { create(:indirect_association) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(indirect_association.id)
      expect(data.jsonapi_type).to eq("indirect_associations")
    end
  end

  describe "filtering" do
    let!(:indirect_association1) { create(:indirect_association) }
    let!(:indirect_association2) { create(:indirect_association) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: indirect_association2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([indirect_association2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:indirect_association1) { create(:indirect_association) }
      let!(:indirect_association2) { create(:indirect_association) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      indirect_association1.id,
                                      indirect_association2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      indirect_association2.id,
                                      indirect_association1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
