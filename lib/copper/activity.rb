module Copper
  class Activity < Base

    extend ApiOperations::Create
    extend ApiOperations::Delete
    extend ApiOperations::Find
    extend ApiOperations::Update
    extend ApiOperations::Search

    attr_accessor :type, :parent, :details

    def self.api_name
      "activities"
    end

  end
end