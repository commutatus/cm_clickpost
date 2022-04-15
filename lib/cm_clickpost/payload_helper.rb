module CmClickpost
    module PayloadHelper
  
      class << self

        def pickup_address_payload(pickup_time)
          {
              "pickup_state": "Tamil Nadu",
              "pickup_address": "Gehna, 5/33, 13th Avenue, Harrington Road, Chetpet",
              "email": "accounts@gehnaindia.com",
              "pickup_time": Time.parse(pickup_time.to_s).iso8601,
              "pickup_pincode": "600031",
              "pickup_city": "Chennai",
              "tin": "33AAFCG6364D1ZY",
              "pickup_name": "Gehna",
              "pickup_country": "IN",
              "pickup_phone": "9840702969"
          }
        end

        def drop_address_payload(client, shipping_address)
          {
              "drop_address": shipping_address.full_address,
              "drop_phone": shipping_address.mobile_number.to_s,
              "drop_country": shipping_address.country.to_s,
              "drop_state": shipping_address.state.to_s,
              "drop_pincode": shipping_address.pincode.to_s,
              "drop_city": shipping_address.city.to_s,
              "drop_name": shipping_address.full_name,
              "drop_email": client.email.to_s
          }
        end

      end
    end
  end