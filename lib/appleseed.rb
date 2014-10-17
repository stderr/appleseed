require 'pandarus'
require 'appleseed/ext/pandarus/model_base'

require 'uri'
require 'faraday'
require 'colorize'
require 'active_support/core_ext/string'

require 'appleseed/templating/templating'
require 'appleseed/seeding/seeding'
require 'appleseed/api/api'

module Appleseed
  def self.seed(file)
    yaml = File.read(file)
    templates = Appleseed::Templating.from(yaml)
    templates.each do |template|
      Appleseed::Seeding.seed_with(template)
    end
  end

  def self.cache
    @cache ||= Hash.new([])
  end

  def self.root
    File.dirname __dir__
  end

  def self.client
    raise "You must supply a valid API token to use Appleseed" unless Appleseed.config.api_token

    @client ||= Pandarus::Client.new(prefix: URI.join(Appleseed.config.api_url, "api").to_s, token: Appleseed.config.api_token)
  end

  def self.custom_client
    raise "You must supply a valid API token to use Appleseed" unless Appleseed.config.api_token

    @custom_client ||= Faraday.new(url: Appleseed.config.api_url)
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
      @api_url = "http://localhost:3000"
      @api_token = nil
    end
  end
end
