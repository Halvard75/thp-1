json.extract! flight, :id, :flight_code, :duration, :departure_date, :departure_airport, :arrival_airport, :created_at, :updated_at
json.url flight_url(flight, format: :json)
