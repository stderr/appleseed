require 'spec_helper'

module Appleseed
	module Template
  	describe Course do
  		it "should default to medium size" do
  			@course = Course.new()
  			expect(@course.size).to eq("medium")
  		end

  		it "should default to moderate activity" do
  			@course = Course.new()
  			expect(@course.activity).to eq("moderate")
  		end
  	end
  end
end
