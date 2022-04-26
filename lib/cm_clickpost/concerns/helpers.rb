module CmClickpost
  module Concerns
    module Helpers
      extend ActiveSupport::Concern
      included do
        def convert_to_json(data)
          return data.as_json.map {|a| a['attributes'].with_indifferent_access } if data.instance_of? (Array)
          data.as_json['attributes'].with_indifferent_access
        end
      end
    end
  end
end