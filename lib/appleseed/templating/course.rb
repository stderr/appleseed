module Appleseed
  module Templating
    class Course < BaseTemplate
      attr_accessor :size, :activity, :account_id
      def self.create_method; :create_new_course; end

      def initialize(fields={})
        raise "You must supply an account_id to Course" unless fields.key?(:account_id)

        @size = fields.fetch(:size, "medium")
        @activity = fields.fetch(:activity, "moderate")
        @account_id = fields.fetch(:account_id)
      end

      def seed_data
        {
          course: {
            name: name
          }
        }
      end

      def generate
        puts "Creating course: #{name}...".red

       yield(self)

        Random.new.rand(2..6).times do
          section = CourseSection.new(course_id: canvas_id)
          puts "...creating section #{section.name}".yellow
          yield(section)
        end

        size_as_num.times do
          user = User.new(account_id: account_id)
          puts "Creating user: #{user.name}...".blue
          yield user
          if user.canvas_id
            puts "...enrolling".yellow
            yield Enrollment.new(course_id: canvas_id, user_id: user.canvas_id)
            if rand <= 0.5
              yield SectionEnrollment.new(section_id: Appleseed.cache['course_section'].sample, user_id: user.canvas_id)
            end
          end
        end
      end

      def name
        @name ||= [Faker::Hacker.ingverb,
                   Faker::Hacker.adjective,
                   Faker::Hacker.noun.pluralize].join(" ").titleize
      end

      def scoped_attrs
        [account_id]
      end

      private
      def size_as_num
        # whatever numbers for right now
        r = Random.new
        {
          small: r.rand(10..20),
          medium: r.rand(20..50),
          large: r.rand(50..200)
        }[size.to_sym]
      end

    end
  end
end
