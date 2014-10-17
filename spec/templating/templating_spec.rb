require 'spec_helper'

module Appleseed
  describe Templating do
    describe ".from" do
      it "loads a template from a YAML string" do
        expect(Templating.from(yaml)).to be_kind_of(Appleseed::Templating::Course)
      end
    end

    def yaml
      <<-eos
course:
  size: large
  account_id: 1
      eos
    end
  end
end
