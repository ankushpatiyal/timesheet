json.array!(@clients) do |client|
  json.extract! client, :id, :title, :description, :address, :latitude, :longitude
  json.url client_url(client, format: :json)
end
