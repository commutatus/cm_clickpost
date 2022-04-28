module CmClickpost
    class PickupAddress < CmClickpost::BasePayload
        @@attributes = [
            :pickup_state, :pickup_address, :email, 
            :pickup_time, :pickup_pincode, :pickup_city, :tin, 
            :pickup_phone, :pickup_country, :pickup_name
        ]

        
        define_class_methods(@@attributes, @attributes)


    end
end