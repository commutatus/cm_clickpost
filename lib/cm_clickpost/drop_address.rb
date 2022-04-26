module CmClickpost
    class DropAddress
        @@attributes = [:drop_state, :drop_address, :drop_email, :drop_pincode, :drop_city, :drop_phone, :drop_country, :drop_name]

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