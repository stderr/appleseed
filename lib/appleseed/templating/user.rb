module Appleseed
  module Templating
    class User
      attr_accessor :scoped_id, :canvas_id

      def self.create_method; :create_user; end

      def initialize(data={})
        @scoped_id = data[:account_id] || 1
      end

      def seed_data
        {
          user: {
            name: name
          },
          pseudonym: {
            unique_id: email,
            password: email + "123" # as realistic as it comes.
          }
        }
      end

      def name
        @name ||= Faker::Name.name
      end

      # todo: need dupe checking here.
      def email
        @email ||= Faker::Internet.email
      end
    end
  end
end
