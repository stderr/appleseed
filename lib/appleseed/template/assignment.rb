module Appleseed
  module Template
    class Assignment
    	attr_accessor :submission_type

      def initialize(data={})
        @submission_type = data[:submission_type] || "text_entry"
      end
    end
  end
end
