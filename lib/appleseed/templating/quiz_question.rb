module Appleseed
  module Templating
    class QuizQuestion < BaseTemplate
      attr_accessor :question_type, :quiz_id, :course_id, :points_possible
      def self.custom_request?; true; end

      def initialize(fields={})
        raise "You must supply a course_id to QuizQuestion" unless fields.key?(:course_id)
        raise "You must supply a quiz_id to QuizQuestion" unless fields.key?(:quiz_id)

        @course_id = fields.fetch(:course_id)
        @quiz_id = fields.fetch(:quiz_id)
        @question_type = fields.fetch(:question_type, 'multiple_choice_question')
        @points_possible = fields.fetch(:points_possible, 1)
      end

      def seed_data
        {
          question: {
            question_name: question_name,
            question_text: question_text,
            question_type: @question_type,
            answers: answers,
            points_possible: @points_possible
          }
        }
      end

     def answers
       # hard coded to multiple choice right now
       @answers ||= begin
                      collection = []
                      r = Random.new
                      r.rand(3..6).times do
                        collection << {
                          answer_text: Faker::Lorem.sentence(3, false, 7),
                          answer_weight: 0
                        }
                      end
                      collection.sample[:answer_weight] = 100
                      collection
       end
     end

      def question_name
        @question_name ||= Faker::Lorem.word.capitalize
      end

      def question_text
        @question_text ||= Faker::Lorem.sentence(3, false, 7)
      end

      def endpoint
        "/api/v1/courses/#{course_id}/quizzes/#{quiz_id}/questions"
      end
    end
  end
end
