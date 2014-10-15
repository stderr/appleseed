module Pandarus
  class ModelBase
    remove_method :initialize
    def initialize(attributes = {})
      attributes = attributes.first if attributes.is_a?(Array)
      return if attributes.empty?
      attributes.each_pair do |name, value|
        assign(name, value)
      end
    end
  end
end
