json.array!(@acts) do |act|
  json.extract! act, :id, :date_act_id, :number_act, :money, :street_id
  json.url act_url(act, format: :json)
end
