# == Schema Information
#
# Table name: ideas
#
#  id                 :bigint           not null, primary key
#  associations_count :integer          default(0)
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_ideas_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe 'Direct Associations' do
    it { should have_many(:models) }

    it { should belong_to(:user) }
  end

  describe 'InDirect Associations' do
  end

  describe 'Validations' do
  end
end
