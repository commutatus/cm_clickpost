module CmClickpost
    class BasePayload

    
      def self.define_class_methods(fields, attributes)
        fields.each do |field|
          define_method(field) do
            attributes[field]
          end

          define_method("#{field}=") do |value|
            attributes[field] = value
          end
        end
      
      end

      def initialize(attributes = {})
        @attributes = attributes
      end
    
    end
  end