# == Schema Information
#
# Table name: models
#
#  id                                      :integer          not null, primary key
#  direct_originating_associations_count   :integer
#  direct_terminating_associations_count   :integer
#  indirect_originating_associations_count :integer
#  indirect_terminating_associations_count :integer
#  name                                    :string
#  originating_associations_count          :integer
#  terminating_associations_count          :integer
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#  idea_id                                 :integer
#
require "rails_helper"

RSpec.describe Model, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:idea) }

    it { should have_many(:indirect_terminating_associations) }

    it { should have_many(:indirect_originating_associations) }

    it { should have_many(:direct_terminating_associations) }

    it { should have_many(:direct_originating_associations) }

    it { should have_many(:terminating_associations) }

    it { should have_many(:originating_associations) }
  end

  describe "InDirect Associations" do
    it { should have_many(:terminus_models) }

    it { should have_many(:indirect_origin_models) }

    it { should have_many(:indirect_terminus_models) }
  end

  describe "Validations" do
  end
end
