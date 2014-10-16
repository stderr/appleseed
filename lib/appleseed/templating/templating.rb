require 'yaml'
require 'faker'
require 'active_support/core_ext/hash'

module Appleseed
  module Templating
    def self.from(yaml)
      template = YAML.load(yaml).deep_symbolize_keys
      Templating.load(template)
    end

    def self.load(template)
      type = template.keys.first
      self.const_get(type.to_s.camelize).new(template[type])
    end
  end
end

require 'appleseed/templating/base_template'
require 'appleseed/templating/course'
require 'appleseed/templating/assignment'
require 'appleseed/templating/quiz'
require 'appleseed/templating/quiz_question'
require 'appleseed/templating/user'
require 'appleseed/templating/enrollment'
