require 'spec_helper'

module Appleseed
  module Templating
    describe Assignment do
      it "should default submission_type to text entry" do
        expect(Assignment.new.submission_type).to eq("text_entry")
      end
    end
  end
end
