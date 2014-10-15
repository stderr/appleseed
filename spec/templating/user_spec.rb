require 'spec_helper'

module Appleseed
  module Templating
    describe User do
      let(:user) { User.new }

      context "#initialize" do
        it "defaults to an account_id of 1" do
          expect(user.account_id).to eq(1)
        end
      end

      context "#seed_data" do
        it "scopes to 'user' and 'pseudonym'" do
          expect(user.seed_data).to have_key(:user)
          expect(user.seed_data).to have_key(:pseudonym)
        end

        context "user scope" do
          it "has a name attribute" do
            expect(user.seed_data[:user]).to have_key(:name)
            expect(user.seed_data[:user][:name]).not_to be_blank
          end
        end

        context "pseudonym scope" do
          it "has a unique_id attribute" do
            expect(user.seed_data[:pseudonym]).to have_key(:unique_id)
            expect(user.seed_data[:pseudonym][:unique_id]).not_to be_blank
          end

          it "has a password attribute" do
            expect(user.seed_data[:pseudonym]).to have_key(:password)
            expect(user.seed_data[:pseudonym][:password]).not_to be_blank
          end
        end
      end

      context "#scoped_attrs" do
        it "contains the account_id" do
          u = User.new({"account_id" => 5})
          expect(u.scoped_attrs.size).to eq(1)
          expect(u.scoped_attrs).to include(5)
        end
      end
    end
  end
end
