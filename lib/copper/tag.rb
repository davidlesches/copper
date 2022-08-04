module Copper
  class Tag < Base

    extend ApiOperations::List

    attr_accessor :name,
      :count,
      :count_people,
      :count_leads,
      :count_companies,
      :count_opportunities,
      :count_projects,
      :count_tasks

    def self.api_name
      "tags"
    end

  end
end
