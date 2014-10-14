module Appleseed
  module Templating
    class Enrollment
      attr_accessor :canvas_id, :user_id
      def self.create_method; :enroll_user_courses; end

      def initialize(data={})
        raise "You must supply a course_id to Enrollment" unless data.key?(:course_id)
        raise "You must supply a user_id to Enrollment" unless data.key?(:user_id)

        @scoped_id = data[:course_id]
        @user_id = data[:user_id]
      end

      def seed_data
        {
          enrollment:
          {
            type: "StudentEnrollment",
            user_id: user_id,
            enrollment_state: "active",
            notify: false
          }
        }
      end

      # funkiness in Pandarus requires us to do this.
      def scoped_id
        [@scoped_id, @user_id, "StudentEnrollment"]
      end
    end
  end
end
