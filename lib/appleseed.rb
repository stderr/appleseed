require 'pandarus'
require 'appleseed/ext/pandarus/model_base'
require 'appleseed/ext/pandarus/v1_api'

require 'colorize'
require 'active_support/core_ext/string'
require 'appleseed/templating/templating'
require 'appleseed/seeding/seeding'

module Appleseed
  def self.seed(file)
    yaml = File.read(file)
    template = Appleseed::Templating.from(yaml)
    Appleseed::Seeding.seed_with(template)
  end

  def self.cache
    @cache ||= Hash.new([])
  end

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
    attr_accessor :api_url, :api_token

    def initialize
      @api_url = "http://localhost:3000/api"
      @api_token = nil
    end
  end
end
