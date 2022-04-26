module CmClickpost
    class Order
        @@attributes = [:height, :length, :breadth, :weight, :cod_value, :courier_partner, :order_type, :invoice_value, :invoice_number, :invoice_date, :reference_number]

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