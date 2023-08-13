json.extract! forum, :id, :date, :content, :user_name, :user_id, :lesson_id, :created_at, :updated_at
json.url forum_url(forum, format: :json)
