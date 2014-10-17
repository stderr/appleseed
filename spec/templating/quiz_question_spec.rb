require 'spec_helper'

module Appleseed
  module Templating
    describe QuizQuestion do
      let(:question) { QuizQuestion.new(course_id: 3, quiz_id: 4) }

      it "is a custom request" do
        expect(QuizQuestion.custom_request?).to be_truthy
      end

      it "has an endpoint" do
        expect(question.endpoint).to eq("/api/v1/courses/#{question.course_id}/quizzes/#{question.quiz_id}/questions")
      end

      describe "#initialize" do
        context "raises an exception" do
          it "if a course_id isn't passed" do
            expect { QuizQuestion.new({quiz_id: 5}) }.to raise_error
          end
          it "if a quiz_id isn't passed" do
            expect { QuizQuestion.new({course_id: 5}) }.to raise_error
          end
        end

        it "defaults to a multiple_choice_question type" do
          expect(question.question_type).to eq("multiple_choice_question")
        end

        it "defaults to one point" do
          expect(question.points_possible).to eq(1)
        end
      end

      describe "#seed_data" do
        it "scopes to 'question'" do
          expect(question.seed_data).to have_key(:question)
        end

        context "attributes" do
          it "has a question_name" do
            expect(question.seed_data[:question]).to have_key(:question_name)
            expect(question.seed_data[:question][:question_name]).not_to be_blank
          end

          it "has a question_text" do
            expect(question.seed_data[:question]).to have_key(:question_text)
            expect(question.seed_data[:question][:question_text]).not_to be_blank
          end

          it "has a question_type" do
            expect(question.seed_data[:question]).to have_key(:question_type)
            expect(question.seed_data[:question][:question_type]).not_to be_blank
          end

          it "has a points_possible" do
            expect(question.seed_data[:question]).to have_key(:points_possible)
            expect(question.seed_data[:question][:points_possible]).not_to be_blank
          end
        end
      end
    end
  end
end
