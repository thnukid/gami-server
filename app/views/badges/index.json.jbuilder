json.array!(@badges) do |badge|
  json.extract! badge, :id, :name, :description, :picture, :user_id
  json.url badge_url(badge, format: :json)
end
