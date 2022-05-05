module CmClickpost
    class Configuration
      attr_accessor :api_key, :username, :environment
  
      def initialize(username, api_key, environment)
        @username = username
        @api_key = api_key
        @environment = environment
      end
    end
  end