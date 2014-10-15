require 'yaml'
require 'faker'

module Appleseed
  module Templating
    def self.from(yaml)
      template = YAML.load(yaml)
      Templating.load(template)
    end

    def self.load(template)
      type = template.keys.first
      self.const_get(type.camelize).new(template[type])
    end
  end
end

require 'appleseed/templating/base_template'
require 'appleseed/templating/course'
require 'appleseed/templating/assignment'
require 'appleseed/templating/quiz'
require 'appleseed/templating/user'
require 'appleseed/templating/enrollment'
