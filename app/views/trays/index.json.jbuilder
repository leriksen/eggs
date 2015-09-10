json.array!(@trays) do |tray|
  json.extract! tray, :id, :washed, :waste, :flock_id
  json.url tray_url(tray, format: :json)
end
