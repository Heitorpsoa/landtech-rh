json.job do
    json.id @job.id
    json.title @job.title
    json.description @job.description
    json.start_date @job.start_date
    json.end_date @job.end_date
    json.status @job.status
    json.skills @job.skills
    json.recruiter @recruiter.name
end