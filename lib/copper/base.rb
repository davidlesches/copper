module Copper
  class Base
    include Copper::SerializeEntity
    #
    # Generalized base class, all Copper objects
    # should inherit from this (directly or indirectly,
    # via BaseEntity)
    #

    attr_accessor :id,
                  :date_created

    def self.client
      Copper.client
    end

    def initialize(attributes = {})
      set_attributes(attributes)
    end

    def set_attributes(attributes)
      attributes.each do |key, value|
        if self.respond_to?(key.to_sym)
          self.send("#{key}=", value)
        end
      end
    end

  end
end