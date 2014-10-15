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

			context "#seed_data" do
				it "scopes to 'quiz'" do
					expect(quiz.seed_data).to have_key(:quiz)
				end

				context "attributes" do
					it "has a title" do
						expect(quiz.seed_data[:quiz]).to have_key(:title)
						expect(quiz.seed_data[:quiz][:title]).not_to be_blank
					end

					it "has a description" do
						expect(quiz.seed_data[:quiz]).to have_key(:description)
						expect(quiz.seed_data[:quiz][:description]).not_to be_blank
					end

					it "has a quiz_type" do
						expect(quiz.seed_data[:quiz]).to have_key(:quiz_type)
						expect(quiz.seed_data[:quiz][:quiz_type]).not_to be_blank
					end

					it "has a published attribute" do
						expect(quiz.seed_data[:quiz]).to have_key(:published)
						expect(quiz.seed_data[:quiz][:published]).not_to be_blank
					end
				end
			end

			context "#scoped_attrs" do
				it "contains the course_id" do
					q = Quiz.new("course_id" => 5)
					expect(q.scoped_attrs.size).to eq(1)
					expect(q.scoped_attrs).to include(5)
				end
			end
		end
	end
end
