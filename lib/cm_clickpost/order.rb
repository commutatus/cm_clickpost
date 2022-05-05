module CmClickpost
    class Order < CmClickpost::BasePayload
        @@attributes = [
            :height, :length, :breadth, :weight, 
            :cod_value, :courier_partner, :order_type, :invoice_value, 
            :invoice_number, :invoice_date, :reference_number
        ]

        define_class_methods(@@attributes, @attributes)

    end
end