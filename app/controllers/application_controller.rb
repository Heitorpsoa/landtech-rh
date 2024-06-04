class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, 'rhTesteRails') 
    end

    def decoded_token
        token = request.headers['Authorization']
        if token
            begin
                JWT.decode(token, 'rhTesteRails')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = Recruiter.find_by(id: user_id)
        end
    end

    def authorized
        unless !!current_user
            render json: { message: 'Please log in' }, status: :unauthorized
        end
    end
end
