if !@recruiter.id.nil?
    json.recruiter do
        json.id @recruiter.id
        json.name @recruiter.name
        json.email @recruiter.email
    end
    json.token @token
end

if !@error.nil?
    json.error do
        json.message @error
    end
end