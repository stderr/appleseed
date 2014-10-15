require 'spec_helper'

module Appleseed
  module Templating
    describe Course do
      let(:course) { Course.new }

      context "#initialize" do
        it "defaults to medium size" do
          expect(course.size).to eq("medium")
        end

        it "defaults to moderate activity" do
          expect(course.activity).to eq("moderate")
        end

        it "defaults to an account_id of 1" do
          expect(course.account_id).to eq(1)
        end
      end

      context "#seed_data" do
        it "scopes to 'course'" do
          expect(course.seed_data).to have_key(:course)
        end

        it "has a name attribute" do
          expect(course.seed_data[:course]).to have_key(:name)
          expect(course.seed_data[:course][:name]).not_to be_blank
        end
      end

      context "#scoped_attrs" do
        it "contains the account_id" do
          c = Course.new({ "account_id" => 5})
          expect(c.scoped_attrs.size).to eq(1)
          expect(c.scoped_attrs).to include(5)
        end
      end
    end
  end
end
