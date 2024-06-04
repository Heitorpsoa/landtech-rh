if @token
    json.token @token
end

if @error
    json.error do
        json.message @error
    end
end