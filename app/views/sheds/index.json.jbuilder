json.array!(@sheds) do |shed|
  json.extract! shed, :id, :name
  json.url shed_url(shed, format: :json)
end
