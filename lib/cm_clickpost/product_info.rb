module CmClickpost
    class ProductInfo < CmClickpost::BasePayload
        @@attributes = [:product_url, :price, :description, :additional, :quantity, :sku]

        define_class_methods(@@attributes, @attributes)

    end
end