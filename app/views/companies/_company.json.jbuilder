json.extract! company, :id, :name, :url, :location, :created_at, :updated_at
json.url company_url(company, format: :json)
