# frozen_string_literal: true

# require_relative "cm_clickpost/version"
# require_relative 'cm_clickpost/configuration'
# require_relative 'cm_clickpost/api_version'
# require_relative 'cm_clickpost/concerns/helpers.rb'
# require_relative 'cm_clickpost/pickup_address'
# require_relative 'cm_clickpost/shipment'
# require_relative "cm_clickpost/drop_address"
# require_relative "cm_clickpost/order"
# require_relative "cm_clickpost/product_info"
# require_relative "cm_clickpost/gst_info"
# require_relative "cm_clickpost/additional_info"
# require_relative "cm_clickpost/return_address"

Dir["../cm_clickpost/lib/cm_clickpost/concerns/*.rb"].each { |file| require file }
Dir["../cm_clickpost/lib/cm_clickpost/*.rb"].each { |file| require file }




module CmClickpost
  class << self
    include CmClickpost::Concerns::Helpers

    attr_accessor :configuration, :pickup_address
    require 'net/http'
    require 'uri'
    require 'json'

    BASE_URL = "https://www.clickpost.in/api/"

    def setup(username, api_key, environment)
      @configuration ||= Configuration.new(username, api_key, environment)
    end
    

    def send_request(method: 'post', route_param:, api_version: '', request_payload: '', additional_params: '')
      query_params = "/?username=#{@configuration.username}&key=#{@configuration.api_key}"
      uri = URI.parse(BASE_URL + api_version + route_param  + query_params + additional_params)
      headers = {'Content-Type': 'application/json' }
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = "Net::HTTP::#{method.classify}".constantize.new(uri.request_uri, headers)
      request.body = request_payload.to_json
      response = http.request(request)
      result = JSON.parse(response.body)
      if result['meta']['success'] == true
        return result
      else
        raise Exception.new result['meta']['message']
      end
    end

  end 
end
