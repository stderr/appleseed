module Appleseed
  module Api
    class Client
      def post(endpoint, body)
        Appleseed.custom_client.post(endpoint) do |req|
          req.headers['Authorization'] = "Bearer #{Appleseed.config.api_token}"
          req.headers['Content-Type'] = 'application/json'
          req.body = body
        end
      end
    end
  end
end
