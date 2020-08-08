require "rails_helper"

RSpec.describe Association, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:through_association) }

    it { should have_many(:indirect_associations_as_through) }

    it { should belong_to(:source_association) }

    it { should have_many(:indirect_associations_as_source) }

    it { should belong_to(:indirect_terminus_model) }

    it { should belong_to(:indirect_origin_model) }

    it { should belong_to(:direct_terminus_model) }

    it { should belong_to(:direct_origin_model) }

    it { should belong_to(:terminus_model) }

    it { should belong_to(:origin_model) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
