# frozen_string_literal: true

require_relative "cm_clickpost/version"
require_relative 'cm_clickpost/configuration'
require_relative 'cm_clickpost/api_version'
require_relative 'cm_clickpost/payload_helper'
require_relative 'cm_clickpost/concerns/helpers'

module CmClickpost
  class << self
    include CmClickpost::Concerns::Helpers

    attr_accessor :configuration
    require 'net/http'
    require 'uri'
    require 'json'

    def setup(username, api_key, environment)
      @configuration ||= Configuration.new(username, api_key, environment)
    end

    def create_shipment()
    end

    def send_request(route_param, api_version, request_payload)
      byebug
      base_url = "https://www.clickpost.in/api/"
      query_params = "/?#{username=@configuration.username}&#{key=@configuration.api_key}"
      
      uri = URI.parse(base_url + route_param + api_version + query_params)
      headers = {'Content-Type': 'application/json' }
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      byebug
      puts request_payload.to_json
      request.body = request_payload.to_json
      # Send the request
      response = http.request(request)
      return JSON.parse(response.body)
    end
  end 
end
