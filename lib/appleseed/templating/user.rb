module Appleseed
  module Templating
    class User < BaseTemplate
      attr_accessor :account_id

      def initialize(data={})
        @account_id = data["account_id"] || 1
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

      def scoped_attrs
        [@account_id]
      end

      # todo: need dupe checking here.
      def email
        @email ||= Faker::Internet.email
      end
    end
  end
end
