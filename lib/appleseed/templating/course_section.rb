module Appleseed
  module Templating
    class CourseSection < BaseTemplate
      attr_accessor :course_id, :base_name
      def self.create_method; :create_course_section; end

      def initialize(fields={})
        raise "You must supply a course_id to CourseSection" unless fields.key?(:course_id)

        @course_id = fields.fetch(:course_id)
        @base_name = fields.fetch(:base_name, "Section")
      end

      def seed_data
        {
          course_section: {
            name: name,
          }
        }
      end

      def scoped_attrs
        [course_id]
      end

      def name
        @name ||= [base_name, Faker::Lorem.word.capitalize].join(" ")
      end
    end
  end
end
