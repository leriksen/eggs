json.array!(@tray_types) do |tray_type|
  json.extract! tray_type, :id, :type
  json.url tray_type_url(tray_type, format: :json)
end
