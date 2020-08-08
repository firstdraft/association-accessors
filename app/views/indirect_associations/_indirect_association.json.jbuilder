json.extract! indirect_association, :id, :name, :source_association_id, :source_association_type, :through_association_id, :through_association_type, :origin_model_id, :terminus_model_id, :created_at, :updated_at
json.url indirect_association_url(indirect_association, format: :json)
