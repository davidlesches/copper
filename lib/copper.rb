require 'copper/api_operations/connect'
require 'copper/utils'

require 'copper/api_operations/create'
require 'copper/api_operations/delete'
require 'copper/api_operations/find'
require 'copper/api_operations/list'
require 'copper/api_operations/search'
require 'copper/api_operations/update'

require 'copper/errors/base'
require 'copper/errors/bad_request'
require 'copper/errors/forbidden'
require 'copper/errors/not_found'
require 'copper/errors/rate_limit'
require 'copper/errors/server_error'
require 'copper/errors/unauthorized'
require 'copper/errors/unprocessable'


require 'copper/base'
require 'copper/base_entity'
require 'copper/client'
require 'copper/company'
require 'copper/configuration'
require 'copper/lead'
require 'copper/opportunity'
require 'copper/pipeline'
require 'copper/pipeline_stage'
require 'copper/customer_source'
require 'copper/person'
require 'copper/tag'
require 'copper/custom_field'
require 'copper/activity'
require 'copper/activity_type'
require 'copper/project'
require 'copper/task'
require 'copper/version'
require 'copper/webhook'
require 'copper/loss_reason'

module Copper

    def self.reset!
      @client = nil
    end

    def self.client
      @client ||= Client.new
    end

    def self.configure(&block)
      reset!
      client.configure(&block)
    end
end
