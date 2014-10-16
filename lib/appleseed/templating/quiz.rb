module Appleseed
  module Templating
    class Quiz < BaseTemplate
      attr_accessor :title, :description, :quiz_type, :published, :course_id, :size, :canvas_id

      def initialize(fields={})
        @published = fields.fetch(:published, true)
        @quiz_type = fields.fetch(:quiz_type, "assignment")
        @course_id = fields.fetch(:course_id, Appleseed.cache["course"].sample)
        @size = fields.fetch(:size, "small")
      end

      def seed_data
        {
          quiz: {
            title: title,
            description: description,
            quiz_type: quiz_type,
            published: published
          }
        }
      end

      def generate
        puts "Creating quiz: #{title}...".green
        yield(self)

        size_as_num.times do |n|
          puts "Creating question...".blue
          yield QuizQuestion.new(course_id: course_id, quiz_id: canvas_id)
        end
      end

      def title
        @title ||= [Faker::Hacker.ingverb,
                    Faker::Hacker.noun.pluralize].join(" ").titleize
      end

      def description
        @description ||= Faker::Hacker.say_something_smart
      end

      def scoped_attrs
        [course_id]
      end

      private
      def size_as_num
        r = Random.new
        {
          small: r.rand(2..5),
          medium: r.rand(10..20),
          large: r.rand(40..60)
        }[size.to_sym]
      end


    end
  end
end
