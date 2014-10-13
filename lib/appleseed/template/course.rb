module Appleseed
  module Template
    class Course
    	attr_accessor :size, :activity

      def initialize(data={})
        @size = data[:size] || "medium"
        @activity = data[:activity] || "moderate"
      end
    end
  end
end
