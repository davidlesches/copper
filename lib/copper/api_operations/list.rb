require 'net/http'

module Copper
  module ApiOperations
    module List

      include ApiOperations::Connect

      def list
        uri = get_uri(api_name)

        response = send_request("get", uri)
        handle_multiple_response(response)
      end

    end
  end
end
