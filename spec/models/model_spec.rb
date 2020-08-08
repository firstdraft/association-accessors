require 'rails_helper'

RSpec.describe Model, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:idea) }

    it { should have_many(:terminating_indirect_associations) }

    it { should have_many(:originating_indirect_associations) }

    it { should have_many(:terminating_direct_associations) }

    it { should have_many(:originating_direct_associations) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
