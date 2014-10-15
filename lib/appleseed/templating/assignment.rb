module Appleseed
  module Templating
    class Assignment < BaseTemplate
      attr_accessor :submission_type

      def initialize(data={})
        @submission_type = data[:submission_type] || "text_entry"
      end

      def seed_data
      end
    end
  end
end
