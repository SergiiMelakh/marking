json.array!(@lines) do |line|
  json.extract! line, :id, :name, :view, :describe
  json.url line_url(line, format: :json)
end
