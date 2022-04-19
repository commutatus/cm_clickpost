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

    def create_shipment(pickup_info = {}, drop_info = {}, order_details = {}, product_details = {}, gst_info = {}, additional_info = {}, return_info = {})
      request_payload = {
        "pickup_info": PayloadHelper.pickup_address_payload(pickup_info),
        "drop_info": PayloadHelper.drop_address_payload(drop_info),
        "shipment_details": PayloadHelper.shipping_details_payload(order_details, product_details),
        "gst_info": PayloadHelper.gst_payload(gst_info),
        "additional": PayloadHelper.additional_info_payload(additional_info, return_info)
      }
      send_request('create-order/', 'v3/', request_payload)
    end

    def send_request(route_param, api_version, request_payload)
      base_url = "https://www.clickpost.in/api/"
      query_params = "/?username=#{@configuration.username}&key=#{@configuration.api_key}"
      
      uri = URI.parse(base_url + + api_version + route_param  + query_params)
      headers = {'Content-Type': 'application/json' }
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      puts "REQUEST_PAYLOAD = \n" + request_payload.to_json
      request = Net::HTTP::Post.new(uri.request_uri, headers)
      request.body = request_payload.to_json
      # Send the request
      response = http.request(request)
      return JSON.parse(response.body)
    end

    def api_key
      return configuration.api_key
    end

    def environment
      return configuration.environment
    end
  end 
end
