module Appleseed
  module Seeding
    class Cache
      attr_accessor :store

      def initialize
        clear
      end

      def clear
        @store = {}
      end
    end
  end
end
