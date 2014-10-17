module Appleseed
  module Templating
    class BaseTemplate
      attr_accessor :canvas_id

      def self.create_method; "create_#{self.name.demodulize.underscore}"; end
      def self.custom_request?; false; end

      def endpoint; ""; end

      def scoped_attrs
        []
      end

      def seed_data
        {}
      end

      def pull_from_cache(kind)
        Appleseed.cache.fetch(kind).sample
      end

    end
  end
end
