require 'spec_helper'

module Appleseed
	module Template
  	describe Course do
  		it "should default to medium size" do
  			expect(Course.new.size).to eq("medium")
  		end

  		it "should default to moderate activity" do
  			expect(Course.new.activity).to eq("moderate")
  		end
  	end
  end
end
