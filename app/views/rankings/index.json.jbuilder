json.array!(@rankings) do |ranking|
  json.extract! ranking, :user_id, :points, :sos
  json.url ranking_url(ranking, format: :json)
end
