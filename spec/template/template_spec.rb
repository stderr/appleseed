require 'spec_helper'

module Appleseed
  describe Template do
    describe ".from" do
      it "loads a template from a YAML string" do
        expect(Template.from(yaml)).to be_kind_of(Appleseed::Template::Course)
      end
    end

    def yaml
      <<-eos
course:
  size: large
      eos
    end
  end
end
