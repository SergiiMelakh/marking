json.array!(@date_acts) do |date_act|
  json.extract! date_act, :id, :date
  json.url date_act_url(date_act, format: :json)
end
