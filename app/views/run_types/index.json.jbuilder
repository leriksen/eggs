json.array!(@run_types) do |run_type|
  json.extract! run_type, :id, :type
  json.url run_type_url(run_type, format: :json)
end
