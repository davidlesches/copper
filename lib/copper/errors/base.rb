module Copper
  module Errors
    class Base < StandardError

      def self.status_code
        raise "NotImplemented: Subclass must define status code"
      end

      def self.msg
        raise "NotImplemented: Subclass must define msg"
      end

    end
  end
end