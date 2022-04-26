module CmClickpost
  class Shipment
    attr_accessor :pickup_address, :drop_address, :order_details, :product_details, :products, :gst_info, :additional_info, :return_address
    include CmClickpost::Concerns::Helpers

    def initialize
      @pickup_address = nil
      @drop_address = nil
      @order_details = nil
      @product_details = nil
      @products = []
      @gst_info = nil
      @additional_info = nil
      @return_address = nil
    end

    def pickup_address(**args)
      @pickup_address = CmClickpost::PickupAddress.new(args) if args.present?
      @pickup_address
    end

    def drop_address(**args)
      @drop_address = CmClickpost::DropAddress.new(args) if args.present?
      @drop_address
    end

    def order_details(**args)
      @order_details = CmClickpost::Order.new(args) if args.present?
      @order_details
    end

    def product_details(**args)
      if args.present?
        @product_details = CmClickpost::ProductInfo.new(args) 
        @products << @product_details
        return @product_details
      end
      @products
    end

    def gst_info(**args)
      @gst_info = CmClickpost::GstInfo.new(args) if args.present?
      @gst_info
    end

    def additional_info(**args)
      @additional_info = CmClickpost::AdditionalInfo.new(args) if args.present?
      @additional_info
    end

    def return_address(**args)
      @return_address = CmClickpost::ReturnAddress.new(args) if args.present?
      @return_address
    end

    def create_shipping_order
      shipment_details = convert_to_json(@order_details)
      shipment_details.store(:items, convert_to_json(@products))

      additional = convert_to_json(@additional_info)
      additional.store(:return_info, convert_to_json(@return_address))

      request_payload = {
        "pickup_info": convert_to_json(@pickup_address),
        "drop_info": convert_to_json(@drop_address),
        "shipment_details": shipment_details,
        "gst_info": convert_to_json(@gst_info),
        "additional": additional
      }
      CmClickpost.send_request(route_param: '/create-order/', api_version: ApiVersion::API_VERSIONS[:create_order], request_payload: request_payload)
    end
  end
end