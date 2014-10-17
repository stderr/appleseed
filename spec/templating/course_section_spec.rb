require 'spec_helper'

module Appleseed
  module Templating
    describe CourseSection do
      let(:section) { CourseSection.new({course_id: 1}) }

      describe "#initialize" do
        context "raises an exception" do
          it "if course_id isn't passed" do
            expect { CourseSection.new }.to raise_error
          end
        end

        context "doesn't raise an exception" do
          it "if course_id is passed" do
            expect { CourseSection.new(course_id: 1) }.to_not raise_error
          end
        end
      end

      describe "#seed_data" do
        it "scopes to 'course_section'" do
          expect(section.seed_data).to have_key(:course_section)
        end

        it "has a name attribute" do
          expect(section.seed_data[:course_section]).to have_key(:name)
          expect(section.seed_data[:course_section][:name]).not_to be_blank

        end
      end

      describe "#scoped_attrs" do
        it "contains the course_id" do
          course_id = 3
          s = CourseSection.new(course_id: course_id)
          expect(s.scoped_attrs).to eq([course_id])
        end
      end
    end
  end
end
