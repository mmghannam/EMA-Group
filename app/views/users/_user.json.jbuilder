json.extract! user, :id, :type, :name, :address, :landline_number, :mobile_number, :workplace, :created_at, :updated_at
json.url user_url(user, format: :json)