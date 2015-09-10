json.array!(@flocks) do |flock|
  json.extract! flock, :id, :name
  json.url flock_url(flock, format: :json)
end
