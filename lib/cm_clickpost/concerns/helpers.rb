module CmClickpost
  module Concerns
    module Helpers
      extend ActiveSupport::Concern
      included do
        def full_name(address)
          address.first_name + address.last_name
        end

        def full_address_line(address)
          address.address_line_1.to_s + address.address_line_2.to_s
        end
      end
    end
  end
end