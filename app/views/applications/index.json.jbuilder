json.array!(@applications) do |application|
  json.extract! application, :id, :exhibition, :artst
  json.url application_url(application, format: :json)
end
