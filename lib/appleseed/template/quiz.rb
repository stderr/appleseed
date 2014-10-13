module Appleseed
  module Template
    class Quiz
    	#placeholder for to-be-determined data
    	attr_accessor :some_data

      def initialize(data={})
        @some_data = data[:some_data] || "some_default"
      end
    end
  end
end
