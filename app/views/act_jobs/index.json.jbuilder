json.array!(@act_jobs) do |act_job|
  json.extract! act_job, :id, :act_id, :line_id, :square, :machine
  json.url act_job_url(act_job, format: :json)
end
