module CmClickpost
    class ReturnAddress
        @@attributes = [:state, :address, :pincode, :city, :phone, :country, :name]

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