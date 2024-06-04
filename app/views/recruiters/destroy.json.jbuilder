if !@error.nil?
    json.error do
        json.message @error
    end
else
    json.message "ok"
end 