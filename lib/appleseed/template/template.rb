require 'yaml'

module Appleseed
  module Template
    def self.from(yaml)
      template = YAML.load(yaml)
      Template.load(template)
    end

    def self.load(template)
      type = template.keys.first
      self.const_get(type.camelize).new(template[type])
    end
  end
end

require 'appleseed/template/course'
