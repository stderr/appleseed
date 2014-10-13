require 'active_support/core_ext/string'
require 'appleseed/template/template'

module Appleseed

  def self.root
    File.dirname __dir__
  end

  # Configuration
  class << self
    attr_accessor :config
  end


  def self.configure
    self.config ||= Config.new
    yield(config)
  end

  class Config
    attr_accessor :template_directory

    def initialize
      @template_directory = File.join Appleseed.root, 'templates'
    end
  end
end
