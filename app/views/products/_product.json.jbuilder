json.extract! product, :id, :category_id, :name, :price_pharmacy, :price_population, :comments, :created_at, :updated_at
json.url product_url(product, format: :json)