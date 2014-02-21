json.array!(@installations) do |installation|
  json.extract! installation, :id, :exhibition, :artist
  json.url installation_url(installation, format: :json)
end
