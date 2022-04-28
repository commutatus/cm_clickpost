module CmClickpost
    class DropAddress < CmClickpost::BasePayload
        @@attributes = [
            :drop_state, :drop_address, :drop_email, 
            :drop_pincode, :drop_city, :drop_phone, :drop_country, :drop_name
        ]

        define_class_methods(@@attributes, @attributes)

    end
end