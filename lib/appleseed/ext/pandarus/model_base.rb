module Pandarus
  class ModelBase
    # Unfortunately, Pandarus has issues with the newish JSONAPI
    # style of some API endpoints in Canvas. This will fix it.
    alias_method :original_initialize, :initialize
    def initialize(attributes = {})
      attributes = attributes.first if attributes.is_a?(Array)
      original_initialize(attributes)
    end
  end
end
