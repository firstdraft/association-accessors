class Model < ApplicationRecord
  # Direct associations

  belongs_to :idea

  has_many   :terminating_indirect_associations,
             :class_name => "IndirectAssociation",
             :foreign_key => "terminus_model_id",
             :dependent => :destroy

  has_many   :originating_indirect_associations,
             :class_name => "IndirectAssociation",
             :foreign_key => "origin_model_id",
             :dependent => :destroy

  has_many   :terminating_direct_associations,
             :class_name => "DirectAssociation",
             :foreign_key => "terminus_model_id",
             :dependent => :destroy

  has_many   :originating_direct_associations,
             :class_name => "DirectAssociation",
             :foreign_key => "origin_model_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :direct_origin_models,
             :through => :terminating_direct_associations,
             :source => :origin_model

  has_many   :direct_terminus_models,
             :through => :originating_direct_associations,
             :source => :terminus_model

  # Validations

  # Scopes

  def to_s
    name
  end

end
