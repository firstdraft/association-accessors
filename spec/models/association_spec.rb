# == Schema Information
#
# Table name: associations
#
#  id                                     :integer          not null, primary key
#  foreign_key                            :string
#  indirect_associations_as_source_count  :integer
#  indirect_associations_as_through_count :integer
#  name                                   :string
#  nature                                 :integer
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#  origin_model_id                        :integer
#  source_association_id                  :integer
#  terminus_model_id                      :integer
#  through_association_id                 :integer
#
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
