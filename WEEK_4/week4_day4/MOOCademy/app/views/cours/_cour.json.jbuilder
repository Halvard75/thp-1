json.extract! cour, :id, :titre, :description, :created_at, :updated_at
json.url cour_url(cour, format: :json)
