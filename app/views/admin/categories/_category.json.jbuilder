json.extract! category, :id, :parent_id, :name, :comments, :created_at, :updated_at
json.url category_url(category, format: :json)