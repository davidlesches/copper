require 'json'
require 'ostruct'

module Copper
  module ApiOperations
    module Connect

      def get_uri(api_name, id = nil)
        url = client.base_url + "#{api_name}"
        url = url + "/#{id}" unless id.nil?
        URI.parse(url)
      end

      def send_request(http_type, uri, entity = nil)
        response = nil
        headers = client.headers

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.start do
          case http_type
          when "get"
            request = Net::HTTP::Get.new(uri.request_uri, headers)
          when "post"
            request = Net::HTTP::Post.new(uri.request_uri, headers)
            request.body = entity.to_json
          when "put"
            request = Net::HTTP::Put.new(uri.request_uri, headers)
            request.body = entity.to_json
          when "delete"
            request = Net::HTTP::Delete.new(uri.request_uri, headers)
          end
          response = http.request(request)
        end

        response
      end

      def handle_response(entity, response)
        case response.code.to_i
        when 200
          json_object = JSON.parse(response.body)
          return json_object if json_object.is_a?(Array)

          json_object.each_pair do |key, value|
            if entity.respond_to?(key.to_sym)
              entity.send("#{key}=", value)
            end
          end

          entity
        when Errors::BadRequest.status_code
          raise Errors::BadRequest
        when Errors::Unauthorized.status_code
          raise Errors::Unauthorized
        when Errors::Forbidden.status_code
          raise Errors::Forbidden
        when Errors::NotFound.status_code
          raise Errors::NotFound
        when Errors::Unprocessable.status_code
          raise(Errors::Unprocessable, response.body.to_s)
        when Errors::RateLimit.status_code
          raise Errors::RateLimit
        else
          raise Errors::ServerError
        end
      end

      def handle_multiple_response(response)
        result = handle_response(nil, response)
        if result.is_a?(Copper::Errors::Base)
          # pass the error along
          result
        else
          result.map do |res|
            new(res)
          end
        end
      end
    end
  end
end
