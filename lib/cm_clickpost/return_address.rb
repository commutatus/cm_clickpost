module CmClickpost
    class ReturnAddress < CmClickpost::BasePayload
        @@attributes = [:state, :address, :pincode, :city, :phone, :country, :name]

        define_class_methods(@@attributes, @attributes)

    end
end