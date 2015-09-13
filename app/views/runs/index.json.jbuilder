json.array!(@runs) do |run|
  json.extract! run, :id, :standard, :waste, :flock_id, :jumbo, :seconds, :user, :active
  json.url run_url(run, format: :json)
end
