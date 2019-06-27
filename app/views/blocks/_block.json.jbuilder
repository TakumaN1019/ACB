json.extract! block, :id, :name, :content, :category, :user_id, :created_at, :updated_at
json.url block_url(block, format: :json)
