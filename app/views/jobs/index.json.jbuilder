json.array!(@jobs) do |job|
  json.extract! job, :id, :date_job_id, :line_id, :square, :street_id, :house, :note
  json.url job_url(job, format: :json)
end
