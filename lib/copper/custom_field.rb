module Copper
  class CustomField < Base

    extend ApiOperations::List
    extend ApiOperations::Find

    attr_accessor :name,
      :data_type,
      :options

    def self.api_name
      "custom_field_definitions"
    end

  end
end
