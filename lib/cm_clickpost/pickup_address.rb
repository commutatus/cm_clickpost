module CmClickpost
    class PickupAddress
        @@attributes = [:pickup_state, :pickup_address, :email, :pickup_time, :pickup_pincode, :pickup_city, :tin, :pickup_phone, :pickup_country, :pickup_name]

        @@attributes.each do |attribute|
            define_method(attribute) do
                @attributes[attribute]
            end

            define_method("#{attribute}=") do |value|
                @attributes[attribute] = value
            end
        end

        def initialize(attributes = {})
            @attributes = attributes.slice(*@@attributes)
        end

    end
end