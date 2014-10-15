module Appleseed
  module Templating
    class Quiz < BaseTemplate
      #placeholder for to-be-determined data
      attr_accessor :title, :published, :course_id

      def initialize(data={})
        @published = data.fetch(:published, true)
        @course_id = data.fetch(:course_id, 1)
      end

      def seed_data
        {
          quiz: {
            title: title,
            published: published
          }
        }
      end

      def title
        @title ||= [Faker::Hacker.ingverb,
                    Faker::Hacker.noun.pluralize].join(" ").titleize
      end

      def scoped_attrs
        [course_id]
      end
    end
  end
end
