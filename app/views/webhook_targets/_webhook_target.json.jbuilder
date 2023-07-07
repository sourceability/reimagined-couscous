json.extract! webhook_target, :id, :repository, :token, :created_at, :updated_at
json.url webhook_target_url(webhook_target, format: :json)
