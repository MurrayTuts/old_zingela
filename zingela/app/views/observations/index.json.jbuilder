json.array!(@observations) do |observation|
  json.extract! observation, :id, :notes, :field_data_id
  json.url observation_url(observation, format: :json)
end
