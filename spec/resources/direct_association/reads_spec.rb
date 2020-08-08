require "rails_helper"

RSpec.describe DirectAssociationResource, type: :resource do
  describe "serialization" do
    let!(:direct_association) { create(:direct_association) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(direct_association.id)
      expect(data.jsonapi_type).to eq("direct_associations")
    end
  end

  describe "filtering" do
    let!(:direct_association1) { create(:direct_association) }
    let!(:direct_association2) { create(:direct_association) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: direct_association2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([direct_association2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:direct_association1) { create(:direct_association) }
      let!(:direct_association2) { create(:direct_association) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      direct_association1.id,
                                      direct_association2.id,
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
                                      direct_association2.id,
                                      direct_association1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
