module Appleseed
  module Templating
    class BaseTemplate
      attr_accessor :canvas_id

      def self.create_method; "create_#{self.name.demodulize.underscore}"; end

      def scoped_attrs
        []
      end

      def seed_data
        {}
      end
    end
  end
end
