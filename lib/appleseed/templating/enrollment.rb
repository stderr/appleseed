module Appleseed
  module Templating
    class Enrollment < BaseTemplate
      attr_accessor :user_id, :course_id, :type
      def self.create_method; :enroll_user_courses; end

      def initialize(fields={})
        raise "You must supply a course_id to Enrollment" unless fields.key?(:course_id)
        raise "You must supply a user_id to Enrollment" unless fields.key?(:user_id)

        @course_id = fields[:course_id]
        @user_id = fields[:user_id]
        @type = fields[:type] || "StudentEnrollment"
      end

      def seed_data
        {
          enrollment:
          {
            type: type,
            user_id: user_id,
            enrollment_state: "active",
            notify: false
          }
        }
      end

      def scoped_attrs
        [course_id, user_id, type]
      end
    end
  end
end
