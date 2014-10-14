module Appleseed
  module Templating
    class Quiz
      #placeholder for to-be-determined data
      attr_accessor :some_data
      def self.create_method; :create_quiz; end

      def initialize(data={})
        @some_data = data[:some_data] || "some_default"
      end

      def seed_data

      end
    end
  end
end
