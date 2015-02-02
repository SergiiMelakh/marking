json.array!(@streets) do |street|
  json.extract! street, :id, :street
  json.url street_url(street, format: :json)
end
