module Appleseed
  module Seeding
    class Cache
      attr_accessor :store

      def initialize
        clear
      end

      def clear
        @store = Hash.new([])
      end
    end
  end
end
