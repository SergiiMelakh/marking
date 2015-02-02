json.array!(@date_jobs) do |date_job|
  json.extract! date_job, :id, :date
  json.url date_job_url(date_job, format: :json)
end
