module Copper
  class ActivityType < Base

    extend ApiOperations::List

    attr_accessor :name,
      :is_disabled,
      :category,
      :count_as_interaction

    def self.api_name
      "activity_types"
    end

    def self.handle_response(entity, response)
      case response.code.to_i
      when 200
        json_object = JSON.parse(response.body)
        return json_object['user']
      else
        super
      end
    end

  end
end