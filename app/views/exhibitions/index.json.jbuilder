json.array!(@exhibitions) do |exhibition|
  json.extract! exhibition, :id, :start_date, :end_date, :name, :submission_start, :submission_end
  json.url exhibition_url(exhibition, format: :json)
end
