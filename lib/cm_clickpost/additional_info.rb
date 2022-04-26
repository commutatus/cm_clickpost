module CmClickpost
    class AdditionalInfo
        @@attributes = [:label, :awb_number, :delivery_type, :async, :gst_number, :account_code, :order_date, :is_fragile, :is_dangerous, :order_id]

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