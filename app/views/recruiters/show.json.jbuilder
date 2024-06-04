
if !@recruiter.nil?
    json.recruiter do
        json.id @recruiter.id
        json.name @recruiter.name
        json.email @recruiter.email
    end
end

if !@error.nil?
    json.error do
        json.message @error
    end
end