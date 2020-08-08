json.extract! association, :id, :name, :source_association_id, :through_association_id, :origin_model_id, :terminus_model_id, :foreign_key, :nature, :created_at, :updated_at
json.url association_url(association, format: :json)
