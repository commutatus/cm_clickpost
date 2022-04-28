module CmClickpost
    class AdditionalInfo < CmClickpost::BasePayload
        @@attributes = [:label, :awb_number, :delivery_type, :async, :gst_number, :account_code, :order_date, :is_fragile, :is_dangerous, :order_id]

        define_class_methods(@@attributes, @attributes)

    end
end