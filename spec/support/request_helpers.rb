module Request
  module AuthHelpers
    def auth_headers(user)
      auth_token = Knock::AuthToken.new(payload: { sub: user.id }).token
			return { Authorization: "Bearer #{auth_token}" }
    end
  end
end

#config.include Request::AuthHelpers, type: :request
