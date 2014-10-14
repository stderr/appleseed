module Appleseed
  module Templating
    class Assignment
    	attr_accessor :submission_type
      def self.create_method; :create_assignment; end

      def initialize(data={})
        @submission_type = data[:submission_type] || "text_entry"
      end

      def seed_data
      end
    end
  end
end
