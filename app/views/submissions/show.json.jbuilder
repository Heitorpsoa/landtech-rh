if !@submission.id.nil?
    json.submission do
        json.id @submission.id
        json.name @submission.name
        json.email @submission.email
        json.mobile_phone @submission.mobile_phone
        json.resume @submission.resume
    end
end