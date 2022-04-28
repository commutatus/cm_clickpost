module CmClickpost
    class GstInfo < CmClickpost::BasePayload
        @@attributes = [:seller_gstin, :taxable_value, :is_seller_registered_under_gst, :place_of_supply, :hsn_code, :enterprise_gstin, :gst_total_tax, :igst_amount, :cgst_amount, :consignee_gstin, :invoice_reference]

        define_class_methods(@@attributes, @attributes)

    end
end