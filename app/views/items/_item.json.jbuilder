json.extract! item, :id, :name, :weight, :brand, :price, :description, :created_at, :updated_at
json.url item_url(item, format: :json)
