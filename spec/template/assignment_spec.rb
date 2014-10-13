require 'spec_helper'

module Appleseed
	module Template
  	describe Assignment do
  		it "should default submission_type to text entry" do
  			@assignment = Assignment.new()
  			expect(@assignment.submission_type).to eq("text_entry")
  		end
  	end
  end
end
