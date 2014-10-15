require 'spec_helper'

module Appleseed
  module Templating
    describe Quiz do
    	let(:quiz) { Quiz.new }

    	context "#initialize" do
    		it "defaults to published" do
        	expect(quiz.published).to eq(true)
      	end

      	it "defaults to an assignment type" do
   				expect(quiz.quiz_type).to eq("assignment")
      	end

      	it "defaults to a course_id of 1" do
      		expect(quiz.course_id).to eq(1)
      	end
    	end

    	context "#scoped_attrs" do
    		it "contains the course_id" do
    			q = Quiz.new(course_id: 5)
    			expect(q.scoped_attrs.size).to eq(1)
    			expect(q.scoped_attrs).to include(5)
    		end
    	end

  		context "#title" do
  			it "should generate a non-blank title" do
  				expect(quiz.title).not_to be_empty
  			end
  		end

  		context "#description" do
  			it "should generate a non-blank description" do
  				expect(quiz.description).not_to be_empty
  			end
  		end
    end
  end
end
