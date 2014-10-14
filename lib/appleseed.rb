require 'pandarus'
require 'colorize'
require 'active_support/core_ext/string'
require 'appleseed/templating/templating'
require 'appleseed/seeding/seeding'

module Appleseed
  def self.root
    File.dirname __dir__
  end

  def self.client
    raise "You must supply a valid API token to use Appleseed" unless Appleseed.config.api_token

    @client ||= Pandarus::Client.new(prefix: Appleseed.config.api_url, token: Appleseed.config.api_token)
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
    attr_accessor :template_directory, :api_url, :api_token

    def initialize
      @template_directory = File.join Appleseed.root, 'templates'
      @api_url = "http://localhost:3000/api"
      @api_token = nil
    end
  end
end
