module Appleseed
  module Templating
    class SectionEnrollment < BaseTemplate
      attr_accessor :user_id, :section_id, :type
      def self.create_method; :enroll_user_sections; end

      def initialize(fields={})
        raise "You must supply a section_id to SectionEnrollment" unless fields.key?(:section_id)
        raise "You must supply a user_id to SectionEnrollment" unless fields.key?(:user_id)

        @section_id = fields[:section_id]
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
        [section_id, user_id, type]
      end
    end
  end
end
