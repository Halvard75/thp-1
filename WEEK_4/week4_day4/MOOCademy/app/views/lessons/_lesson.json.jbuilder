json.extract! lesson, :id, :titre, :body, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
