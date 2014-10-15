require 'spec_helper'

module Appleseed
  module Templating
    describe Enrollment do
      let(:enrollment) { Enrollment.new({course_id: 1, user_id: 5}) }

      context "#initialize" do
        context "raises an exception" do
          it "if course_id isn't passed" do
            expect { Enrollment.new({user_id: 5}) }.to raise_error
          end
          it "if user_id isn't passed" do
            expect { Enrollment.new({course_id: 1}) }.to raise_error
          end
        end

        context "doesn't raise an exception" do
          it "if both course_id and user_id are passed" do
            expect { Enrollment.new({course_id: 1, user_id: 5}) }.to_not raise_error
          end
        end
      end

      context "#seed_data" do
        it "scopes to 'enrollment'" do
          expect(enrollment.seed_data).to have_key(:enrollment)
        end

        it "has a type attribute" do
          expect(enrollment.seed_data[:enrollment]).to have_key(:type)
          expect(enrollment.seed_data[:enrollment][:type]).to eq("StudentEnrollment")
        end

        it "has a user_id attribute" do
          expect(enrollment.seed_data[:enrollment]).to have_key(:user_id)
          expect(enrollment.seed_data[:enrollment][:user_id]).to eq(5)
        end

        it "has an enrollment_state attribute" do
          expect(enrollment.seed_data[:enrollment]).to have_key(:enrollment_state)
          expect(enrollment.seed_data[:enrollment][:enrollment_state]).to eq("active")
        end

        it "has a notify attribute" do
          expect(enrollment.seed_data[:enrollment]).to have_key(:notify)
          expect(enrollment.seed_data[:enrollment][:notify]).to eq(false)
        end
      end

      context "#scoped_attrs" do
        it "contains the course_id, user_id, and enrollment_type, in that order" do
          user_id = 5
          course_id = 1
          e = Enrollment.new({user_id: user_id, course_id: course_id, type: "TeacherEnrollment"})
          expect(e.scoped_attrs).to eq([course_id, user_id, "TeacherEnrollment"])
        end
      end
    end
  end
end
