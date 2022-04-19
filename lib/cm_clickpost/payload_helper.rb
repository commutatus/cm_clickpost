module CmClickpost
    module PayloadHelper
  
      class << self

        def pickup_address_payload(pickup_info = {})
          {
              "pickup_state": pickup_info.fetch(:pickup_state),
              "pickup_address": pickup_info.fetch(:pickup_address),
              "email": pickup_info.fetch(:email),
              "pickup_time": pickup_info.fetch(:pickup_time_in_iso_format),
              "pickup_pincode": pickup_info.fetch(:pickup_pincode),
              "pickup_city": pickup_info.fetch(:pickup_city),
              "tin": pickup_info.fetch(:tin),
              "pickup_name": pickup_info.fetch(:pickup_name),
              "pickup_country": pickup_info.fetch(:pickup_country, "IN"),
              "pickup_phone": pickup_info.fetch(:pickup_phone)
          }
        end

        def drop_address_payload(drop_info = {})
          {
              "drop_address": drop_info.fetch(:drop_address),
              "drop_phone": drop_info.fetch(:drop_phone),
              "drop_country": drop_info.fetch(:drop_country, 'IN'),
              "drop_state": drop_info.fetch(:drop_state),
              "drop_pincode": drop_info.fetch(:drop_pincode),
              "drop_city": drop_info.fetch(:drop_city),
              "drop_name": drop_info.fetch(:drop_name),
              "drop_email": drop_info.fetch(:drop_email)
          }
        end

        def shipping_details_payload(order_details = {}, product_details = {})
          {
            "height": order_details.fetch(:height),
            "order_type": order_details.fetch(:payment_mode).upcase == 'COD' ? 'COD' : 'PREPAID',
            "invoice_value": order_details.fetch(:order_amount).to_f,
            "invoice_number": order_details.fetch(:invoice_number),
            "invoice_date": order_details.fetch(:invoice_date).strftime("%Y-%m-%d"),
            "reference_number": order_details.fetch(:reference_number),
            "length": order_details.fetch(:length).to_i,
            "breadth": order_details.fetch(:breadth).to_i,
            "weight": order_details.fetch(:weight).to_i,
            "items": shipping_products_list(product_details),
            "cod_value": order_details.fetch(:payment_mode) == 'COD'? order_details.fetch(:order_amount) : 0,
            "courier_partner": order_details.fetch(:courier_partner_code).to_i
          }
        end

        def shipping_products_list(product_details_list = [])
          product_list = []
          product_details_list.each do |product_details|
            product_list << {
                                "product_url": product_details.fetch(:product_url),
                                "price": product_details.fetch(:price),
                                "description": product_details.fetch(:description, "Not Available"),
                                "additional": {
                                    "length": product_details.fetch(:length),
                                    "height": product_details.fetch(:height),
                                    "breadth": product_details.fetch(:breadth),
                                    "weight": product_details.fetch(:weight),
                                    "images": product_details.fetch(:images_comma_separated_link)
                                },
                                "quantity": product_details.fetch(:quantity),
                                "sku": product_details.fetch(:sku)
                            }
            end
        end

        def gst_payload(gst_info = {})
          {
            "seller_gstin": gst_info.fetch(:seller_gst_number),
            "taxable_value": gst_info.fetch(:taxable_value),
            "is_seller_registered_under_gst": gst_info.fetch(:is_seller_registered_under_gst, true),
            "place_of_supply": gst_info.fetch(:place_of_supply),
            "hsn_code": gst_info.fetch(:product_hsn),
            "enterprise_gstin": gst_info.fetch(:enterprise_gstin),
            "gst_total_tax": gst_info.fetch(:gst_total_tax).to_f,
            "igst_amount": gst_info.fetch(:igst_amount).to_f,
            "cgst_amount": gst_info.fetch(:cgst_amount).to_f,
            "consignee_gstin": gst_info.fetch(:consignee_gstin, ""),
            "invoice_reference": gst_info.fetch(:invoice_number),
          }
        end

        def additional_info_payload(additional_info = {}, return_info = {})
          {
              "label ": true,
              "return_info": {
                  "pincode": return_info.fetch(:return_pincode),
                  "address": return_info.fetch(:return_address),
                  "state": return_info.fetch(:return_state),
                  "phone": return_info.fetch(:return_phone_number),
                  "name": return_info.fetch(:return_name),
                  "city": return_info.fetch(:return_city),
                  "country": return_info.fetch(:return_country, "IN")
              },
              "awb_number": additional_info.fetch(:awb_number, ""),
              "delivery_type": "FORWARD",
              "async": false,
              "gst_number": additional_info.fetch(:gst_number),
              "account_code": additional_info.fetch(:account_code_for_courier, ""),
              "order_date": additional_info.fetch(:order_date, DateTime.now).strftime("%Y-%m-%d"),
              "is_fragile": additional_info.fetch(:is_fragile, false),
              "is_dangerous": additional_info.fetch(:is_dangerous, false),
              "order_id": additional_info.fetch(:shipment_order_id)
            }
        end
  
     end
    end
  end