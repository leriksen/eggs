json.array!(@flocks) do |flock|
  json.extract! flock, :id, :name, :active
  json.url flock_url(flock, format: :json)
end
