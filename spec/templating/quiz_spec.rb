require 'spec_helper'

module Appleseed
  module Templating
    describe Quiz do
      it "should default some_data to some_default" do
        expect(Quiz.new.some_data).to eq("some_default")
      end
    end
  end
end
