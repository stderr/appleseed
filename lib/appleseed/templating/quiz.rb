module Appleseed
  module Templating
    class Quiz < BaseTemplate
      attr_accessor :title, :description, :quiz_type, :published, :course_id

      def initialize(fields={})
        @published = fields.fetch(:published, true)
        @quiz_type = fields.fetch(:quiz_type, "assignment")
        @course_id = fields.fetch(:course_id, 1)
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
    end
  end
end
