json.array!(@mugs) do |mug|
  json.extract! mug, :id, :capacity, :material, :decoration
  json.url mug_url(mug, format: :json)
end
