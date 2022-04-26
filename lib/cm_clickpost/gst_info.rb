module CmClickpost
    class GstInfo
        @@attributes = [:seller_gstin, :taxable_value, :is_seller_registered_under_gst, :place_of_supply, :hsn_code, :enterprise_gstin, :gst_total_tax, :igst_amount, :cgst_amount, :consignee_gstin, :invoice_reference]

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