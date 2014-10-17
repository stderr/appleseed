require 'spec_helper'

module Appleseed
  describe Templating do
    describe ".from" do
      it "loads an array of templates from a YAML string" do
        templates = Templating.from(yaml)
        expect(templates).to be_kind_of Array
        expect(templates.first).to be_kind_of Appleseed::Templating::Course
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
