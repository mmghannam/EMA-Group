json.extract! offer, :id, :title, :description, :start, :end, :created_at, :updated_at
json.url offer_url(offer, format: :json)